import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String? message;
  String? token;

  final _url = 'https://identitytoolkit.googleapis.com/v1/';
  final _resource = 'accounts:signUp?key='; // isgnInWithPassword
  final _apiKey = 'AIzaSyDIbQcdHXo2G3musrB5M62A9-lM5hiniRA';

  Future<bool> signUp(String email, String password) async {
    String sUri = '$_url$_resource$_apiKey';
    Uri uri = Uri.parse(sUri);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'returnSecureToken': 'true'
    });
    var resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      message = "Usuário cadastrado com sucesso!";
      token = resp["idToken"];
      return true;
    } else {
      message = "Erro ao cadastrar Usuário!";
      return false;
    }
  }
}
