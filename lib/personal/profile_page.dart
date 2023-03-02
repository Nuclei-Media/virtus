import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nuclei_mobile/auth/login_page.dart';
import 'package:nuclei_mobile/auth/login_checker.dart';
import 'package:nuclei_mobile/auth/login_utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // call your logout function from your auth logic file
              deleteToken();
              // navigate to login page
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to your profile!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final token = await getToken();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Access Token'),
                    content: Text(token ?? 'No token found'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show Access Token'),
            ),
          ],
        ),
      ),
    );
  }
}
