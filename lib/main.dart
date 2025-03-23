import 'package:firebase_core/firebase_core.dart'; // Importa la librería de Firebase Core, necesaria para inicializar Firebase en la aplicación.
import 'package:flutter/material.dart'; // Importa la librería de Flutter Material Design, usada para construir la interfaz de usuario.
import 'package:residencia_cepamm/database/firebase_options.dart'; // Importa las opciones de configuración de Firebase, que contienen las credenciales de acceso a Firebase para la aplicación.
import 'package:residencia_cepamm/src/login.dart';

Future<void> main() async {
  // Función principal que se ejecuta al iniciar la aplicación.
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura que el binding de Flutter esté inicializado antes de ejecutar cualquier código de la app.
  DefaultFirebaseOptions
      .currentPlatform; // Se obtiene la configuración predeterminada de Firebase según la plataforma actual (Android, iOS, etc.).

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform); // Inicializa Firebase con las opciones predeterminadas para la plataforma actual.
  runApp(
      const MainApp()); // Lanza la aplicación Flutter, pasando la clase MainApp como la raíz de la app.
}

class MainApp extends StatelessWidget {
  // Clase principal de la aplicación, que extiende StatelessWidget (sin estado).
  const MainApp({super.key}); // Constructor de la clase MainApp.

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de usuario.
    return const MaterialApp(
        home:
            Login()); // Retorna un MaterialApp con la pantalla de Login como la pantalla principal.
  }
}
