import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:js';

import '../routes.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = context.watch<AuthProvider>();
    
    String? message = authProvider.message;

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController
            ),
          TextField(
            controller: passwordController
            ),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              authProvider.signUp(email, password)
                .then((sucesso) {
                  if (sucesso) {
                    Navigator.pushReplacementNamed(context, Routes.HOME);
                  } else {
                    // Pegar a mensagem de erro
                  }
                });
            },
            child: const Text("Cadastrar"),
          ),
          if (message != null) Text(message),
        ],
      ),
    );
  }
}
