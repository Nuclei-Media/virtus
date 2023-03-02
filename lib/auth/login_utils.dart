import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_checker.dart';

final _storage = const FlutterSecureStorage();

Future<void> saveToken(String token) async {
  await _storage.write(key: 'access_token', value: token);
}

Future<String?> getToken() async {
  return await _storage.read(key: 'access_token');
}

Future<void> deleteToken() async {
  await _storage.delete(key: 'access_token');
}

Future<void> login(String username, String password) async {
  if (username.isEmpty || password.isEmpty) {
    return;
  } else {
    final uri = Uri.parse('http://localhost:8000/users/token');
    final headers = {'accept': 'application/json'};
    final body = {
      'grant_type': '',
      'username': username,
      'password': password,
      'scope': '',
      'client_id': '',
      'client_secret': '',
    };
    final response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['access_token'] != null) {
        saveToken(data['access_token'].toString());
      }
    } else {
      throw Exception('Failed to login');
    }
  }
}
