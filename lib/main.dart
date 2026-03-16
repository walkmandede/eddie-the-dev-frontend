import 'package:eddie_the_dev_frontend/app.dart';
import 'package:eddie_the_dev_frontend/core/repo/user_info_repo.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseService = FirebaseService();
  final userInfoRepo = UserInfoRepo(firebaseService: firebaseService);

  await firebaseService.init();
  await userInfoRepo.saveUserInfo();

  runApp(const MainApp());
}
