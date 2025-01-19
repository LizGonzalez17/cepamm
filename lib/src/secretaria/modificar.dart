import 'package:flutter/material.dart';

class Modificar extends StatelessWidget {
  const Modificar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // Transparencia de la imagen
              child: Image.asset(
                'assets/sin.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            // Agregar SingleChildScrollView para evitar desbordamiento
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'fundación CEPAMM\nMÓDULO DE MODIFICACIONES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // El campo de ID Paciente más arriba
                const TextFieldWithLabel(label: 'ID Paciente:'),
                const SizedBox(height: 16),
                // Organización de campos en pares
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextFieldWithLabel(label: 'Apellido Paterno:'),
                          TextFieldWithLabel(label: 'Nombre(s):'),
                          TextFieldWithLabel(label: 'Sexo:'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextFieldWithLabel(label: 'Apellido Materno:'),
                          TextFieldWithLabel(label: 'Edad:'),
                          TextFieldWithLabel(label: 'Fecha de Nacimiento:'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Últimos campos en pares
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextFieldWithLabel(label: 'Dirección:'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextFieldWithLabel(label: 'Teléfono celular:'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height:
                        32), // Espacio adicional para mover los botones abajo
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Botón "Salir" con diseño actualizado
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 50), // Tamaño del botón
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Bordes redondeados
                        ),
                        backgroundColor: Colors.blue, // Fondo azul
                        shadowColor: Colors.blueAccent, // Sombra azul
                        elevation: 3, // Elevación para sombra
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Salir',
                        style: TextStyle(
                          color: Colors.black, // Texto negro
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Botón "Modificar" con diseño actualizado
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 50), // Tamaño del botón
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Bordes redondeados
                        ),
                        backgroundColor: Colors.pink, // Fondo rosa
                        shadowColor: Colors.pinkAccent, // Sombra rosa
                        elevation: 3, // Elevación para sombra
                      ),
                      onPressed: () {
                        // Lógica para modificar
                      },
                      child: const Text(
                        'Modificar',
                        style: TextStyle(
                          color: Colors.black, // Texto negro
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWithLabel extends StatelessWidget {
  final String label;

  const TextFieldWithLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
