import 'package:eddie_the_dev_frontend/app.dart';
import 'package:eddie_the_dev_frontend/core/repo/user_info_repo.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:flutter/material.dart';

void main() async {
  final firebaseService = FirebaseService();
  final userInfoRepo = UserInfoRepo(firebaseService: firebaseService);

  try {
    await firebaseService.init();
    await userInfoRepo.saveUserInfo();
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(const MainApp());
}
