import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparktech_flutter/screens/create_account_screen.dart';
import 'package:sparktech_flutter/screens/home_screen.dart';
import 'package:sparktech_flutter/screens/personalizing_course_screen.dart';

import 'feature/auth/presentation/bindings/login_bindings.dart';
import 'feature/auth/presentation/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learnova',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/create_account',
          page: () => const CreateAccountScreen(),
        ),
        GetPage(
          name: '/personalizing_course',
          page: () => const PersonalizingCourseScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
