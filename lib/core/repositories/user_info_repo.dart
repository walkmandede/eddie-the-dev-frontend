import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eddie_the_dev_frontend/core/shared/models/user_info.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:platform_info/platform_info.dart';

class UserInfoRepo {
  Future<UserInfo> getUserInfo() async {
    UserInfo userInfo = UserInfo(
      browserInfo: '',
      dateTime: DateTime.now(),
      ipInfo: {},
    );
    try {
      final browserInfo = Platform.instance.toString();
      userInfo.browserInfo = browserInfo;
      final response = await http.get(Uri.parse('https://ipapi.co/json/'));
      Map<String, dynamic> body = jsonDecode(response.body);
      userInfo.ipInfo = body;
    } catch (e) {
      //
    }
    return userInfo;
  }

  Future<void> saveUserInfo() async {
    final userInfo = await getUserInfo();

    debugPrint(userInfo.toMap().toString());
    final result = await FirebaseFirestore.instance.collection("visitors").add(userInfo.toMap());
    debugPrint(result.toString());
  }
}
