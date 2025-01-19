import 'package:flutter/material.dart';
import 'package:residencia_cepamm/src/secretaria/agregar.dart';
import 'package:residencia_cepamm/src/secretaria/modificar.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo blanco
          Container(color: Colors.white),
          // Contenido principal
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Imagen del logotipo
                Image.asset(
                  'assets/sin.png', // Reemplázalo con la ruta de tu imagen
                  width: 500, // Ajusta el tamaño según sea necesario
                ),
                const SizedBox(width: 50), // Espaciado entre imagen y botones
                // Botones principales
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BotonPrincipal(
                      texto: "Añadir Registro",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Agregar()));
                        // Acción para añadir registro
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      texto: "Borrar Registro",
                      onPressed: () {
                        // Acción para borrar registro
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      texto: "Consultar Datos",
                      onPressed: () {
                        // Acción para consultar datos
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      texto: "Editar Registro",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Modificar()));
                        // Acción para editar registro
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Botón de cerrar sesión
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Acción para cerrar sesión
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para los botones principales
class BotonPrincipal extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotonPrincipal(
      {required this.texto, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
