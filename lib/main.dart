import 'package:firebase_core/firebase_core.dart'; //
import 'package:flutter/material.dart'; //import
import 'package:residencia_cepamm/database/firebase_options.dart'; //
import 'package:residencia_cepamm/src/login.dart'; //

//
Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized(); //
  DefaultFirebaseOptions.currentPlatform; //

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login());
  }
}
