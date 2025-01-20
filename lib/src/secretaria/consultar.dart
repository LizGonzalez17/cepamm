import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MÓDULO DE CONSULTAR DATOS'),
        centerTitle: true,
      ),
      body: Padding(
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
                  onPressed: () {
                    buscar();
                  },
                  child: const Text('Consultar'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ap,
                    decoration: InputDecoration(hintText: "Apellido Paterno"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: nombres,
                    decoration: InputDecoration(hintText: "Nombre(s)"),
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
                    decoration: InputDecoration(hintText: "Edad"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: am,
                    decoration: InputDecoration(hintText: "Apellido Materno"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: sexo,
                    decoration: InputDecoration(hintText: "Sexo"),
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
                    decoration: InputDecoration(hintText: "Teléfono"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: fn,
                    decoration:
                        InputDecoration(hintText: "Fecha de nacimiento"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: direccion,
              decoration: InputDecoration(hintText: "Dirección"),
            ),
            const SizedBox(height: 20),
            // Lista de consultas
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Consulta tipo Fecha'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Consulta tipo Fecha'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Consulta tipo Fecha'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_circle_outline,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Botón Salir
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () {},
                child: const Text('Salir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
