import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Perfilpaciente extends StatefulWidget {
  final String id;
  const Perfilpaciente({super.key, required this.id});

  @override
  State<Perfilpaciente> createState() => _PerfilpacienteState();
}

class _PerfilpacienteState extends State<Perfilpaciente> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('paciente')
          .doc(widget.id)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var data = snapshot.data!.data()!;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text('Perfil del paciente'),
              ],
            ),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titulo y nombre completo

                  Text(
                    '${data['nombres']} ${data['aPaterno']} ${data['aMaterno']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fecha de registro: ${data['fechaRegistro'] ?? 'No disponible'}', // Asegurarse de que no sea nulo
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 20),

                  // Datos del paciente en formato tarjeta
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Datos del paciente',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          _buildInfoRow('Fecha de nacimiento',
                              data['fNacimiento'] ?? 'No disponible'),
                          _buildInfoRow(
                              'Edad', data['edad'] ?? 'No disponible'),
                          _buildInfoRow(
                              'Sexo', data['sexo'] ?? 'No disponible'),
                          _buildInfoRow('RFC', data['rfc'] ?? 'No disponible'),
                          _buildInfoRow(
                              'CURP', data['curp'] ?? 'No disponible'),
                          _buildInfoRow('Estado/Ciudad',
                              data['estadoCiudad'] ?? 'No disponible'),
                          _buildInfoRow('Dirección',
                              data['direccion'] ?? 'No disponible'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Detalles del paciente
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detalles adicionales del paciente',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          // Aquí puedes agregar más detalles si tienes otros campos para mostrar
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Función para construir cada fila de información
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value, // Valor del campo
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
