import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:residencia_cepamm/src/Paciente/FormularioDeslizantePaciente.dart';
import 'package:residencia_cepamm/src/Paciente/perfilpaciente.dart';
import 'package:residencia_cepamm/src/inicio.dart';

class Paciente extends StatefulWidget {
  const Paciente({super.key});

  @override
  State<Paciente> createState() => _PacienteState();
}

class _PacienteState extends State<Paciente> {
  TextEditingController searchController =
      TextEditingController(); // Controlador para el campo de búsqueda
  String searchQuery = ""; // Variable para almacenar la búsqueda actual

  @override
  void dispose() {
    searchController.dispose(); // Limpiar el controlador cuando ya no se use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.lightBlue, // Fondo del appBar con un color más moderno
        title: Text(
          'PACIENTES',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22), // Texto más destacado
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            busqueda(),

            SizedBox(height: 20),

            // Aquí va la lista de pacientes
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('paciente')
                    .where('nombres', isGreaterThanOrEqualTo: searchQuery)
                    .where('nombres', isLessThan: searchQuery + 'z')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No hay pacientes registrados'));
                  }

                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      var data = doc.data() as Map<String, dynamic>;
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 5, // Sombra para las tarjetas
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Bordes redondeados
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors
                                .teal, // Color más atractivo para el icono
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data['nombres']} ${data['aPaterno']} ${data['aMaterno']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'ID: ${data['id']}',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            'Tel: ${data['tel']}',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.teal,
                          ),
                          onTap: () {
                            // Aquí puedes navegar a detalles o hacer alguna acción
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Perfilpaciente(id: data['id'])));
                          },
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget busqueda() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Botón registrar con estilo moderno
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              //  primary: Colors.teal, // Color del botón
              padding: EdgeInsets.symmetric(
                  horizontal: 25, vertical: 12), // Padding más grande
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Bordes redondeados
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Bordes redondeados del diálogo
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Formulariodeslizantepaciente(),
                    ),
                  );
                },
              );
            },
            child: Text(
              'Registrar paciente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 15),

          // Campo de búsqueda
          filtroItem('Buscar paciente', 'Buscar pacientes'),
        ],
      ),
    );
  }

  // Widget para el campo de búsqueda
  Widget filtroItem(String label, String hint) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.teal, width: 2),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
