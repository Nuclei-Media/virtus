import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_page.dart';

class LoggedInChecker extends StatelessWidget {
  final Widget child;

  LoggedInChecker({required this.child});

  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in
    bool isLoggedIn = true; // Replace with your own logic

    // If the user is logged in, return the child widget
    if (isLoggedIn) {
      return child;
    } else {
      // Otherwise, redirect the user to the login page
      return LoginPage();
    }
  }
}

class RequireToken extends StatelessWidget {
  final Widget child;

  RequireToken({required this.child});

  @override
  Widget build(BuildContext context) {
    // Check if the user has a valid token
    bool hasValidToken = true; // Replace with your own logic

    // If the user has a valid token, return the child widget
    if (hasValidToken) {
      return child;
    } else {
      // Otherwise, redirect the user to the login page
      return LoginPage();
    }
  }
}
