import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Agregar extends StatefulWidget {
  const Agregar({Key? key}) : super(key: key);

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  final TextEditingController targeta = TextEditingController();
  final TextEditingController ap = TextEditingController();
  final TextEditingController am = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController fn = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController tel = TextEditingController();
  String generatedId = '';

  @override
  void initState() {
    super.initState();
    _generateId();
  }

  // Función para generar ID consecutivo
  Future<void> _generateId() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('paciente')
          .orderBy('id', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        setState(() {
          generatedId = '00001'; // Inicia con 00001 si no hay documentos
        });
      } else {
        var lastDoc = snapshot.docs.first;
        String lastId = lastDoc['id'];
        int newId = int.parse(lastId) + 1; // Incrementa el último ID
        setState(() {
          generatedId =
              newId.toString().padLeft(5, '0'); // Asegura que tenga 5 dígitos
        });
      }
    } catch (e) {
      print('Error al generar ID: $e');
    }
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: Column(
            children: [
              Text('Asignar targeta'),
              TextField(
                controller: targeta,
                decoration: InputDecoration(hintText: "Targeta"),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                saveData(); // Llamar a la función de guardar
              },
              child: const Text(
                'Aceptar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveData() async {
    String idA = generatedId; // Usar el ID generado automáticamente

    String apB = ap.text;
    String amC = am.text;
    String nombresD = nombres.text;
    String edadE = edad.text;
    String sexoF = sexo.text;
    String fnG = fn.text;
    String direccionH = direccion.text;
    String telI = tel.text;

    if (apB.isNotEmpty &&
        amC.isNotEmpty &&
        nombresD.isNotEmpty &&
        edadE.isNotEmpty &&
        sexoF.isNotEmpty &&
        fnG.isNotEmpty &&
        direccionH.isNotEmpty &&
        telI.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('paciente').doc(idA).set({
          'id': idA,
          'targeta': "",
          'aPaterno': apB,
          'aMaterno': amC,
          'nombres': nombresD,
          'edad': edadE,
          'sexo': sexoF,
          'fNacimiento': fnG,
          'direccion': direccionH,
          'tel': telI
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Paciente guardado correctamente')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar el paciente: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Paciente'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Fundación CEPAMM\nMódulo de Añadir Registro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ID Paciente (Generado automáticamente)
            TextField(
              controller: TextEditingController(text: generatedId),
              decoration: InputDecoration(hintText: "ID Generado"),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFieldWithLabel(
                      label: 'Apellido Paterno', controller: ap),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldWithLabel(
                      label: 'Apellido Materno', controller: am),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFieldWithLabel(
                      label: 'Nombre(s)', controller: nombres),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldWithLabel(label: 'Edad', controller: edad),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFieldWithLabel(label: 'Sexo', controller: sexo),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldWithLabel(
                      label: 'Fecha de Nacimiento', controller: fn),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFieldWithLabel(label: 'Dirección', controller: direccion),
            const SizedBox(height: 16),
            TextFieldWithLabel(label: 'Teléfono', controller: tel),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Salir'),
                  style: ElevatedButton.styleFrom(//primary: Colors.grey
                      ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: saveData,
                  child: const Text('Guardar'),
                  style: ElevatedButton.styleFrom(//primary: Colors.pink
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.controller,
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
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
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
