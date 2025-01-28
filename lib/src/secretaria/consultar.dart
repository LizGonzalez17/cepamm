import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Consultar extends StatefulWidget {
  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController tarjetaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apPaternoController = TextEditingController();
  final TextEditingController apMaternoController = TextEditingController();
  final TextEditingController fnController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telController = TextEditingController();

  void buscarPacientePorId(String id) async {
    if (id.isNotEmpty) {
      try {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('paciente')
            .doc(id)
            .get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data()!;
          setState(() {
            nombreController.text = data['nombres'] ?? '';
            apPaternoController.text = data['aPaterno'] ?? '';
            apMaternoController.text = data['aMaterno'] ?? '';
            fnController.text = data['fNacimiento'] ?? '';
            sexoController.text = data['sexo'] ?? '';
            direccionController.text = data['direccion'] ?? '';
            telController.text = data['tel'] ?? '';
            tarjetaController.text = data['targeta'] ?? '';
          });
        } else {
          // _mostrarMensaje('No se encontró un paciente con ese ID.');
        }
      } catch (e) {
        //  _mostrarMensaje('Error al buscar el paciente: $e');
      }
    }
  }

  void buscarPacientePorTarjeta(String tarjeta) async {
    if (tarjeta.isNotEmpty) {
      try {
        final querySnapshot = await FirebaseFirestore.instance
            .collection('paciente')
            .where('targeta', isEqualTo: tarjeta)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          final data = querySnapshot.docs.first.data();
          setState(() {
            idController.text = data['id'] ?? '';
            nombreController.text = data['nombres'] ?? '';
            apPaternoController.text = data['aPaterno'] ?? '';
            apMaternoController.text = data['aMaterno'] ?? '';
            fnController.text = data['fNacimiento'] ?? '';
            sexoController.text = data['sexo'] ?? '';
            direccionController.text = data['direccion'] ?? '';
            telController.text = data['tel'] ?? '';
          });
        } else {
          // _mostrarMensaje('No se encontró un paciente con esa tarjeta.');
        }
      } catch (e) {
        // _mostrarMensaje('Error al buscar el paciente: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Paciente'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de búsqueda por ID
            Text('ID'),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: buscarPacientePorId,
            ),
            SizedBox(height: 10),

            // Campo de búsqueda por tarjeta
            Text('Tarjeta'),
            TextFormField(
              controller: tarjetaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              onChanged: buscarPacientePorTarjeta,
            ),
            SizedBox(height: 10),

            // Campos de datos
            Text('Nombre'),
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 10),

            Text('Apellido Paterno'),
            TextFormField(
              controller: apPaternoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 10),

            Text('Apellido Materno'),
            TextFormField(
              controller: apMaternoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 10),

            Text('Fecha de Nacimiento'),
            TextFormField(
              controller: fnController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 10),

            Text('Sexo'),
            TextFormField(
              controller: sexoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 10),

            Text('Dirección'),
            TextFormField(
              controller: direccionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 10),

            Text('Teléfono'),
            TextFormField(
              controller: telController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
