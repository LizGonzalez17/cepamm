import 'package:flutter/material.dart'; // Importa la librería de Flutter Material Design, utilizada para construir la interfaz de usuario.
import 'package:residencia_cepamm/src/inicio.dart'; // Importa la pantalla de inicio después de un login exitoso.
import 'package:residencia_cepamm/src/turnos/consultaMedica.dart'; // Importa la pantalla de consulta médica.
import 'package:residencia_cepamm/src/turnos/consultarMturno.dart'; // Importa la pantalla para consultar turnos médicos.
import 'package:residencia_cepamm/src/turnos/turnos.dart'; // Importa la pantalla de turnos.

class Login extends StatefulWidget {
  // Definición de la clase Login, que extiende StatefulWidget para tener estado mutable.
  const Login(
      {super.key}); // Constructor de la clase Login, se utiliza super.key para identificar el widget de forma única.

  @override
  State<Login> createState() =>
      _LoginState(); // Crea el estado de la clase Login con _LoginState.
}

class _LoginState extends State<Login> {
  // Definición de la clase _LoginState, que gestiona el estado de la pantalla Login.
  @override
  Widget build(BuildContext context) {
    // Método para construir la interfaz de usuario.
    return Scaffold(
      // Scaffold crea la estructura básica de la pantalla.
      body: Stack(
        // Stack permite apilar widgets encima de otros.
        children: [
          // Fondo decorativo
          Positioned.fill(
            // Hace que el contenedor ocupe todo el espacio disponible.
            child: Container(
              // Crea un contenedor para el fondo.
              decoration: const BoxDecoration(
                // Se establece la decoración del contenedor.
                gradient: LinearGradient(
                  // Se usa un gradiente de colores.
                  colors: [
                    Colors.white, // Definición del color del gradiente.
                  ],
                  begin: Alignment
                      .topLeft, // El gradiente comienza en la esquina superior izquierda.
                  end: Alignment
                      .bottomRight, // Y termina en la esquina inferior derecha.
                ),
              ),
            ),
          ),
          // Contenido principal
          Center(
            // Centra el contenido dentro de la pantalla.
            child: SingleChildScrollView(
              // Permite hacer scroll en el contenido si es necesario.
              child: Row(
                // Coloca los elementos en una fila.
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los elementos en el eje horizontal.
                children: [
                  // Imagen a la izquierda
                  Image.asset(
                    // Carga una imagen desde los recursos del proyecto.
                    'assets/sin.png', // Ruta de la imagen.
                    width: 500, // Ancho de la imagen.
                  ),
                  const SizedBox(
                      width:
                          40), // Añade un espacio de 40 píxeles entre la imagen y el formulario.
                  // Caja de formulario
                  Container(
                    // Contenedor que contiene el formulario.
                    padding: const EdgeInsets.all(
                        24.0), // Añade un espaciado interno de 24 píxeles.
                    width: 400, // Establece el ancho del formulario.
                    height: 400, // Establece la altura del formulario.
                    decoration: BoxDecoration(
                      // Se configura la decoración del contenedor.
                      color: Colors.white, // Color de fondo blanco.
                      borderRadius: BorderRadius.circular(
                          16), // Bordes redondeados de 16 píxeles.
                      boxShadow: [
                        // Sombra para el contenedor.
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.1), // Color y opacidad de la sombra.
                          blurRadius: 15, // Radio de desenfoque de la sombra.
                          offset: const Offset(
                              0, 6), // Desplazamiento de la sombra.
                        ),
                      ],
                    ),
                    child: Column(
                      // Coloca los elementos en una columna.
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribuye los elementos uniformemente en el eje vertical.
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alineación a la izquierda en el eje horizontal.
                      children: [
                        const Text(
                          // Título del formulario.
                          'Login your account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Fuente en negrita.
                            color: Colors.pink, // Color del texto en rosa.
                            fontSize: 22, // Tamaño de la fuente.
                          ),
                        ),
                        // Campo de usuario
                        const TextField(
                          // Campo de texto para el nombre de usuario.
                          decoration: InputDecoration(
                            // Configuración del campo de texto.
                            labelText: 'Username', // Etiqueta del campo.
                            focusedBorder: UnderlineInputBorder(
                              // Borde cuando el campo está enfocado.
                              borderSide: BorderSide(
                                  color: Colors
                                      .pink), // Color del borde cuando está enfocado.
                            ),
                            enabledBorder: UnderlineInputBorder(
                              // Borde cuando el campo está habilitado.
                              borderSide: BorderSide(
                                  color: Colors
                                      .black), // Color del borde cuando está habilitado.
                            ),
                          ),
                        ),
                        // Campo de contraseña
                        const TextField(
                          // Campo de texto para la contraseña.
                          obscureText:
                              true, // Oculta el texto para la contraseña.
                          decoration: InputDecoration(
                            // Configuración del campo de texto.
                            labelText: 'Password', // Etiqueta del campo.
                            focusedBorder: UnderlineInputBorder(
                              // Borde cuando el campo está enfocado.
                              borderSide: BorderSide(
                                  color: Colors
                                      .pink), // Color del borde cuando está enfocado.
                            ),
                            enabledBorder: UnderlineInputBorder(
                              // Borde cuando el campo está habilitado.
                              borderSide: BorderSide(
                                  color: Colors
                                      .black), // Color del borde cuando está habilitado.
                            ),
                          ),
                        ),
                        // Botón de login
                        SizedBox(
                          // Contenedor para el botón de login.
                          width: double
                              .infinity, // El botón ocupa todo el ancho disponible.
                          child: ElevatedButton(
                            // Botón elevado.
                            onPressed: () {
                              // Acción al presionar el botón.
                              // Lógica de login
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Inicio())); // Navega a la pantalla de Inicio.

                              ScaffoldMessenger.of(context).showSnackBar(
                                // Muestra un mensaje de carga.
                                const SnackBar(content: Text('Logging in...')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              // Estilo del botón.
                              backgroundColor:
                                  Colors.cyan, // Color de fondo del botón.
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16), // Espaciado vertical.
                              shape: RoundedRectangleBorder(
                                // Forma del botón con bordes redondeados.
                                borderRadius: BorderRadius.circular(
                                    4), // Radio de los bordes.
                                side: const BorderSide(
                                  // Borde del botón.
                                  color: Colors.black, // Color del borde.
                                  width: 0.5, // Grosor del borde.
                                ),
                              ),
                            ),
                            child: const Text(
                              // Texto del botón.
                              'Login',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white), // Estilo del texto.
                            ),
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
