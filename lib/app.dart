import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      // theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: HomePage(),
    );
  }
}
