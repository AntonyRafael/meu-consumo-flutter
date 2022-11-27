import 'package:flutter/material.dart';
import 'package:meuconsumo/login.dart';
import 'package:meuconsumo/register.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const DashboardPage(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const DashboardPage(),
    },
  ));
}
