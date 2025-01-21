import 'package:flutter/material.dart';
import 'package:residencia_cepamm/src/inicio.dart';
import 'package:residencia_cepamm/src/turnos/consultaMedica.dart';
import 'package:residencia_cepamm/src/turnos/turnos.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo decorativo
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen a la izquierda
                  Image.asset(
                    'assets/sin.png', // Reemplaza con la ruta de tu imagen
                    width: 500,
                  ),
                  const SizedBox(width: 40),
                  // Caja de formulario
                  Container(
                    padding:
                        const EdgeInsets.all(24.0), // Espaciado interno mayor
                    width: 400, // Ancho del formulario
                    height: 400, // Alto del formulario
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(16), // Bordes redondeados
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribución vertical uniforme
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Alineación a la izquierda
                      children: [
                        const Text(
                          'Login your account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                            fontSize: 22,
                          ),
                        ),
                        // Campo de usuario
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        // Campo de contraseña
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        // Botón de login
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica de login
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Inicio()));

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Logging in...')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(4), // Borde cuadrado
                                side: const BorderSide(
                                  color: Colors.black, // Línea negra alrededor
                                  width: 0.5, // Grosor de la línea
                                ),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ConsultaPage()), // Pantalla principal
                              );
                            },
                            child: const Text("Abrir ambas pantallas"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
