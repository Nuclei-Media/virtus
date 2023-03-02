import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nuclei_mobile/auth/login_page.dart';
import 'package:nuclei_mobile/auth/login_checker.dart';
import 'package:nuclei_mobile/auth/login_utils.dart';
import 'package:nuclei_mobile/personal/profile_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoggedInChecker(
              child: LoginPage(),
            ),
        '/login': (context) => LoggedInChecker(
              child: LoginPage(),
            ),
        // '/register': (context) => LoggedInChecker(
        //       child: RegisterPage(),
        //     ),
        '/profile': (context) => RequireToken(
              child: ProfilePage(),
            ),
        // '/chat': (context) => RequireToken(
        //       child: ChatRoomEntryPage(),
        //     ),
        // '/gallery': (context) => RequireToken(
        //       child: GalleryPage(),
        //     ),
        // '/upload': (context) => RequireToken(
        //       child: UploadPage(),
        //     ),
      },
    );
  }
}

void main() async {
  runApp(MyApp());
}
