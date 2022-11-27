import 'package:flutter/material.dart';
import 'package:meuconsumo/login.dart';
import 'package:meuconsumo/register.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardPage(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'dashboard': (context) => DashboardPage(),
    },
  ));
}
