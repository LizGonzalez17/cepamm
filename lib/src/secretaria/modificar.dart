import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Modificar extends StatefulWidget {
  const Modificar({Key? key}) : super(key: key);

  @override
  State<Modificar> createState() => _ModificarState();
}

class _ModificarState extends State<Modificar> {
  final TextEditingController id = TextEditingController();
  final TextEditingController ap = TextEditingController();
  final TextEditingController am = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController fn = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController tel = TextEditingController();
  String? docId;
  bool isLoading = false;
  Future<void> buscar() async {
    final idA = id.text.trim();

    if (idA.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese el CURP')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final document = await FirebaseFirestore.instance
          .collection('paciente')
          .doc(idA)
          .get();

      if (document.exists) {
        setState(() {
          docId = document.id;
          final data = document.data()!;
          nombres.text = data['nombre(s)'] ?? '';
          ap.text = data['apellido paterno'] ?? '';
          am.text = data['apellido materno'] ?? '';
          edad.text = data['edad'] ?? '';
          sexo.text = data['sexo'] ?? '';
          fn.text = data['fecha nacimiento'] ?? '';
          direccion.text = data['direccion'] ?? '';
          tel.text = data['tel'] ?? '';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No se encontró el alumno con el CURP ingresado')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al buscar alumno: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

// Función para modificar los datos en Firestore
  Future<void> modificar() async {
    if (docId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Primero consulta un registro')),
      );
      return;
    }

    if (nombres.text.trim().isEmpty ||
        ap.text.trim().isEmpty ||
        am.text.trim().isEmpty ||
        edad.text.trim().isEmpty ||
        sexo.text.trim().isEmpty ||
        fn.text.trim().isEmpty ||
        direccion.text.trim().isEmpty ||
        tel.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena todos los campos')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('paciente')
          .doc(docId)
          .update({
        'nombre(s)': nombres.text.trim(),
        'apellido paterno': ap.text.trim(),
        'apellido materno': am.text.trim(),
        'edad': edad.text.trim(),
        'sexo': sexo.text.trim(),
        'fecha nacimiento': fn.text.trim(),
        'direccion': direccion.text.trim(),
        'tel': tel.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos actualizados exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al modificar datos: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                TextField(
                  controller: id,
                  decoration: InputDecoration(hintText: "id"),
                ),
                const SizedBox(height: 16),
                // Organización de campos en pares
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    buscar();
                  },
                  child: const Text('Consultar'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: ap,
                            decoration:
                                InputDecoration(hintText: "Apellido Paterno"),
                          ),
                          TextField(
                            controller: nombres,
                            decoration: InputDecoration(hintText: "Nombre(s)"),
                          ),
                          TextField(
                            controller: sexo,
                            decoration: InputDecoration(hintText: "Sexo"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: am,
                            decoration:
                                InputDecoration(hintText: "Apellido Materno"),
                          ),
                          TextField(
                            controller: edad,
                            decoration: InputDecoration(hintText: "Edad"),
                          ),
                          TextField(
                            controller: fn,
                            decoration: InputDecoration(
                                hintText: "Fecha de nacimiento"),
                          ),
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
                        children: [
                          TextField(
                            controller: direccion,
                            decoration: InputDecoration(hintText: "Dirección"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: tel,
                            decoration: InputDecoration(hintText: "Teléfono"),
                          ),
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
                        modificar();
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
