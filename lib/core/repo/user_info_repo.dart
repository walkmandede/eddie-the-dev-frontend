import 'dart:convert';

import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:eddie_the_dev_frontend/src/models/user_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfoRepo {
  final FirebaseService firebaseService;

  UserInfoRepo({required this.firebaseService});

  Future<UserInfo> getUserInfo() async {
    final userInfo = UserInfo(browserInfo: '', ipInfo: {}, dateTime: DateTime.now());

    try {
      final response = await http.get(Uri.parse('https://ipapi.co/json/'));
      userInfo.ipInfo = jsonDecode(response.body);
    } catch (e) {
      debugPrint(e.toString());
    }

    return userInfo;
  }

  Future<void> saveUserInfo() async {
    try {
      await firebaseService.saveADocument(collectionId: 'visitors', data: (await getUserInfo()).toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
