import 'dart:convert';

import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/repo/user_info_repo.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:eddie_the_dev_frontend/src/models/user_info.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  List<UserInfo> _userInfos = [];
  UserInfoRepo userInfoRepo = UserInfoRepo(firebaseService: FirebaseService());

  @override
  void initState() {
    initLoad();
    super.initState();
  }

  initLoad() async {
    _userInfos = await userInfoRepo.getUserInfos();
    setState(() {});
  }

  String prettyJson(Map data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (e) {
      return data.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    initLoad();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: kBasePaddingM,
          vertical: kBasePaddingM,
        ),
        itemCount: _userInfos.length,
        itemBuilder: (context, index) {
          final userInfo = _userInfos[index];
          return ExpansionTile(
            title: Text(userInfo.dateTime.toString().substring(0, 16)),
            subtitle: Text(userInfo.ipInfo['country'] ?? '-'),
            children: [
              Text('Browser Info'),
              Text(userInfo.browserInfo),
              const Divider(),
              Text('IP Info'),
              Text(prettyJson(userInfo.ipInfo)),
            ],
          );
        },
      ),
    );
  }
}
