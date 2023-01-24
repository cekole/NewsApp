import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servislet_case/constants/appConstant.dart';
import 'package:servislet_case/screens/home/home_page.dart';
import 'package:servislet_case/screens/new_detail.dart';
import 'package:servislet_case/screens/splash/splash_screen.dart';
import 'package:servislet_case/screens/web_view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
        ),
        primaryColor: Color(0xff262c38),
        scaffoldBackgroundColor: bgColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const NewDetail(),
        '/webview': (context) => const WebView(),
      },
    );
  }
}
