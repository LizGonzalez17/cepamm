import 'package:flutter/material.dart';

class Agregar extends StatelessWidget {
  const Agregar({Key? key}) : super(key: key);

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
                    'fundación CEPAMM\nMÓDULO DE AÑADIR REGISTRO',
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 50), // Tamaño reducido
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Cuadrado
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white, // Color de texto blanco
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Salir'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 50), // Tamaño reducido
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Cuadrado
                        ),
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white, // Color de texto blanco
                      ),
                      onPressed: () {
                        // Lógica para guardar
                      },
                      child: const Text('Guardar'),
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
