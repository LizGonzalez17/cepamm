import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Modificar extends StatefulWidget {
  const Modificar({super.key});

  @override
  State<Modificar> createState() => _ModificarState();
}

class _ModificarState extends State<Modificar> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController tarjetaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apPaternoController = TextEditingController();
  final TextEditingController apMaternoController = TextEditingController();
  final TextEditingController fnController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController curpController = TextEditingController();

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
            tarjetaController.text = data['targeta'] ?? '';
            nombreController.text = data['nombres'] ?? '';
            apPaternoController.text = data['aPaterno'] ?? '';
            apMaternoController.text = data['aMaterno'] ?? '';
            fnController.text = data['fNacimiento'] ?? '';
            sexoController.text = data['sexo'] ?? '';
            rfcController.text = data['rfc'] ?? '';
            curpController.text = data['curp'] ?? '';
          });
        } else {
          _mostrarMensaje('No se encontró un paciente con ese ID.');
        }
      } catch (e) {
        _mostrarMensaje('Error al buscar el paciente: $e');
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
            rfcController.text = data['rfc'] ?? '';
            curpController.text = data['curp'] ?? '';
          });
        } else {
          _mostrarMensaje('No se encontró un paciente con esa tarjeta.');
        }
      } catch (e) {
        _mostrarMensaje('Error al buscar el paciente: $e');
      }
    }
  }

  void actualizarPaciente() async {
    String id = idController.text.trim();
    if (id.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('paciente').doc(id).update({
          'targeta': tarjetaController.text.trim(),
          'nombres': nombreController.text.trim(),
          'aPaterno': apPaternoController.text.trim(),
          'aMaterno': apMaternoController.text.trim(),
          'fNacimiento': fnController.text.trim(),
          'sexo': sexoController.text.trim(),
          'rfc': rfcController.text.trim(),
          'curp': curpController.text.trim(),
        });
        _mostrarMensaje('Datos actualizados exitosamente.');
      } catch (e) {
        _mostrarMensaje('Error al actualizar los datos: $e');
      }
    } else {
      _mostrarMensaje('El ID no puede estar vacío.');
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Paciente'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buscar por ID
            Text('ID'),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              onChanged: buscarPacientePorId,
            ),
            SizedBox(height: 10),

            // Buscar por tarjeta
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

            // Campos para modificar
            Text('Nombre'),
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text('Apellido Paterno'),
            TextFormField(
              controller: apPaternoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text('Apellido Materno'),
            TextFormField(
              controller: apMaternoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text('Fecha de Nacimiento'),
            TextFormField(
              controller: fnController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text('Sexo'),
            TextFormField(
              controller: sexoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text('RFC'),
            TextFormField(
              controller: rfcController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text('CURP'),
            TextFormField(
              controller: curpController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Botón de guardar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: actualizarPaciente,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text('Guardar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text('Salir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
