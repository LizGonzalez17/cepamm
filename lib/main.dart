import 'package:flutter/material.dart';
import 'package:residencia_cepamm/src/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login());
  }
}
/**hola completa tu nombre */