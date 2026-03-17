import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:eddie_the_dev_frontend/core/services/uuid_service.dart';
import 'package:eddie_the_dev_frontend/src/models/user_info.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserInfoRepo {
  final FirebaseService firebaseService;

  UserInfoRepo({required this.firebaseService});

  final String _collectionId = 'visitors';

  Future<UserInfo> _getDeviceUserInfo() async {
    final userInfo = UserInfo(browserInfo: '', ipInfo: {}, dateTime: DateTime.now().toUtc());

    try {
      final response = await http.get(Uri.parse('https://ipapi.co/json/'));
      userInfo.ipInfo = jsonDecode(response.body);
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      userInfo.browserInfo = (await deviceInfo.webBrowserInfo).data.toString();
    } catch (e) {
      debugPrint(e.toString());
    }

    return userInfo;
  }

  Future<void> saveUserInfo() async {
    try {
      final visitorId = await UuidService.getVisitorId();
      final userInfo = await _getDeviceUserInfo();

      final docRef = FirebaseFirestore.instance.collection(_collectionId).doc(visitorId);

      final doc = await docRef.get();

      if (doc.exists) {
        await docRef.update({
          'lastSeen': DateTime.now().toUtc(),
          'visitCount': FieldValue.increment(1),
        });
      } else {
        await docRef.set({
          'visitorId': visitorId,
          'firstSeen': DateTime.now().toUtc(),
          'lastSeen': DateTime.now().toUtc(),
          'visitCount': 1,
          'ipInfo': userInfo.ipInfo,
          'browserInfo': userInfo.browserInfo,
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<UserInfo>> getUserInfos() async {
    final userInfos = <UserInfo>[];
    final qs = await firebaseService.getDocuments(collectionId: _collectionId);

    for (final doc in qs.docs) {
      final userInfo = UserInfo.fromMap(doc.data() as Map<String, dynamic>);
      userInfos.add(userInfo);
    }

    return userInfos;
  }
}
