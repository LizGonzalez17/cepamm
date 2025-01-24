import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Consultar extends StatefulWidget {
  const Consultar({super.key});

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
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
  List<Map<String, dynamic>> historial = []; // Aquí guardaremos el historial

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

          // Limpiar el historial antes de agregar nuevas consultas
          historial.clear();

          // Obtener las consultas y agregar solo especialidad y fecha de registro al historial
          var consultas = data['consultas'] ?? {};
          consultas.forEach((key, consulta) {
            if (consulta is Map<String, dynamic>) {
              String specialty = consulta['especialidad'] ?? 'No disponible';
              String date = (consulta['fecha_registro'] is Timestamp)
                  ? DateFormat('yyyy-MM-dd HH:mm:ss').format(
                      (consulta['fecha_registro'] as Timestamp).toDate())
                  : 'No disponible';

              // Agregar al historial
              historial
                  .add({'especialidad': specialty, 'fecha_registro': date});
            }
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('No se encontró el paciente con el CURP ingresado')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al buscar paciente: $e')),
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
      appBar: AppBar(
        title: const Text('MÓDULO DE CONSULTAR DATOS'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Desactiva la flecha de regreso
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo y Título
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/sin.png', height: 100), // Añade tu logo
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Campos de entrada
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: id,
                      decoration: const InputDecoration(hintText: "id"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: buscar,
                    child: const Text('Consultar'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Campos para los detalles del paciente
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: ap,
                      decoration:
                          const InputDecoration(hintText: "Apellido Paterno"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: nombres,
                      decoration: const InputDecoration(hintText: "Nombre(s)"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: edad,
                      decoration: const InputDecoration(hintText: "Edad"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: am,
                      decoration:
                          const InputDecoration(hintText: "Apellido Materno"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: sexo,
                      decoration: const InputDecoration(hintText: "Sexo"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tel,
                      decoration: const InputDecoration(hintText: "Teléfono"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: fn,
                      decoration: const InputDecoration(
                          hintText: "Fecha de nacimiento"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: direccion,
                decoration: const InputDecoration(hintText: "Dirección"),
              ),
              const SizedBox(height: 20),
              // Historial de consultas
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: historial.length,
                  itemBuilder: (context, index) {
                    // Acceder a los datos de cada consulta
                    var consulta = historial[index];
                    String specialty =
                        consulta['especialidad'] ?? 'No disponible';
                    String date = consulta['fecha_registro'] ?? 'No disponible';

                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: Text('Especialidad: $specialty'),
                          subtitle: Text('Fecha de registro: $date'),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Botón Salir
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Salir',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
