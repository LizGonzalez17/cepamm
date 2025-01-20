import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Agregar extends StatefulWidget {
  const Agregar({Key? key}) : super(key: key);

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  final TextEditingController id = TextEditingController();
  final TextEditingController ap = TextEditingController();
  final TextEditingController am = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController fn = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController tel = TextEditingController();

  Future<void> saveData() async {
    String idA = id.text;
    String apB = ap.text;
    String amC = am.text;
    String nombresD = nombres.text;
    String edadE = edad.text;
    String sexoF = sexo.text;
    String fnG = fn.text;
    String direccionH = direccion.text;
    String telI = tel.text;

    if (idA.isNotEmpty &&
        apB.isNotEmpty &&
        amC.isNotEmpty &&
        nombresD.isNotEmpty &&
        edadE.isNotEmpty &&
        sexoF.isNotEmpty &&
        fnG.isNotEmpty &&
        direccionH.isNotEmpty &&
        telI.isNotEmpty) {try{QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('paciente')
            .doc(idA).set({'id':idA,'apellido paterno':apB,'apellido materno':amC,'nombre(s)':nombresD,'edad':edadE,'sexo':sexoF,'fecha nacimiento':fnG,'direccion':direccionH,'tel':telI});
  
  }catch}
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
                TextField(
                  controller: id,
                  decoration: InputDecoration(hintText: "id"),
                ),
                const SizedBox(height: 16),
                // Organización de campos en pares
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
                    // Botón "Salir" con nuevo diseño
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
                    // Botón "Guardar" con nuevo diseño
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
                        // Lógica para guardar
                      },
                      child: const Text(
                        'Guardar',
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
