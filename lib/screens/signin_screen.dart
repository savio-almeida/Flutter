import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

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
            controller: emailController,
          ),
          TextField(
            controller: passwordController,
            ),
          ElevatedButton(onPressed: () {},
            child: const Text("Acessar"),
          ),
          if (message != null) Text(message),
        ],
        ),
    );
  }
  }
