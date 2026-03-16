import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
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
      final userInfo = await _getDeviceUserInfo();

      if (!kDebugMode) {
        await firebaseService.saveADocument(collectionId: _collectionId, data: userInfo.toMap());
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
