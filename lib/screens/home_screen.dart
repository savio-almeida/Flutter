
import 'package:auto_control_panel/components/abast_form.dart';
import 'package:auto_control_panel/providers/abast_provider.dart';
import 'package:auto_control_panel/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/abast_list.dart';
import '../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    // ...
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'about_screen').then((value) {
                String valor = value as String;
                print("Voltando para a Home Screen $valor");
              });
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: const AbastList(),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.local_gas_station),
              title: const Text("Abastecimentos"),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                // Navigator.pushNamed(context, routeName)
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt),
              title: const Text("Formulário"),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, Routes.FORM);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Sobre nós"),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                // Navigator.pushNamed(context, routeName)
              },
            ),
          ],
        ),
      ),
    );
  }
}
