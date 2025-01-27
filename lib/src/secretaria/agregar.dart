import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Agregar extends StatefulWidget {
  const Agregar({Key? key}) : super(key: key);

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  //final TextEditingController tarjeta = TextEditingController(); //nueva
  final TextEditingController id = TextEditingController();
  final TextEditingController ap = TextEditingController();
  final TextEditingController am = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController fn = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController tel = TextEditingController();
  //final TextEditingController tipoPaciente = TextEditingController(); //
  //final TextEditingController especialista = TextEditingController(); //
  //final TextEditingController rfc = TextEditingController(); //
  //final TextEditingController curp = TextEditingController(); //
  //final TextEditingController lugar = TextEditingController(); //
  //final TextEditingController seguro = TextEditingController(); //

  Future<void> saveData() async {
    //String tar = tarjeta.text; //nuevo
    String idA = id.text;
    String apB = ap.text;
    String amC = am.text;
    String nombresD = nombres.text;
    String edadE = edad.text;
    String sexoF = sexo.text;
    String fnG = fn.text;
    String direccionH = direccion.text;
    String telI = tel.text;
    //String tp = tipoPaciente.text; //
    //String esp = especialista.text; //
    //String rf = rfc.text; //
    //String cur = curp.text; //
    //String lug = lugar.text; //
    //String seg = seguro.text; //

    if ( //tar.isNotEmpty && //
        idA.isNotEmpty &&
            apB.isNotEmpty &&
            amC.isNotEmpty &&
            nombresD.isNotEmpty &&
            edadE.isNotEmpty &&
            sexoF.isNotEmpty &&
            fnG.isNotEmpty &&
            direccionH.isNotEmpty &&
            telI.isNotEmpty
        //tp.isNotEmpty && //
        //tp.isNotEmpty && //
        //esp.isNotEmpty && //
        //rf.isNotEmpty && //
        //cur.isNotEmpty && //
        //lug.isNotEmpty && //
        //seg.isNotEmpty
        ) {
      try {
        await FirebaseFirestore.instance.collection('paciente').doc(idA).set({
          //'tarjeta': tar, //
          'id': idA,
          'apellido paterno': apB,
          'apellido materno': amC,
          'nombre(s)': nombresD,
          'edad': edadE,
          'sexo': sexoF,
          'fecha nacimiento': fnG,
          'direccion': direccionH,
          'tel': telI,
          //'tipoPaciente': tp,
          //'especialista': esp,
          //'rfc': rf,
          //'curp': cur,
          //'lugar': lug,
          //'seguro': seg,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar el alumno: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Editar Paciente'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Primera fila: ID, Nombre, Apellido Paterno y Apellido Materno
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Número de tarjeta'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID'),
                        TextFormField(
                          controller: id,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nombre'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Apellido Paterno'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Apellido Materno'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Segunda fila: Tipo de Paciente, Especialista, Fecha de Nacimiento, Sexo
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tipo Paciente'),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('General'),
                              value: 'General',
                            ),
                            DropdownMenuItem(
                              child: Text('Especialista'),
                              value: 'Especialista',
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Especialista'),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('Cardiología'),
                              value: 'Cardiología',
                            ),
                            DropdownMenuItem(
                              child: Text('Neurología'),
                              value: 'Neurología',
                            ),
                            DropdownMenuItem(
                              child: Text('Dermatología'),
                              value: 'Dermatología',
                            ),
                            DropdownMenuItem(
                              child: Text('Pediatría'),
                              value: 'Pediatría',
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fecha de Nacimiento'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sexo'),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('Masculino'),
                              value: 'Masculino',
                            ),
                            DropdownMenuItem(
                              child: Text('Femenino'),
                              value: 'Femenino',
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Tercera fila: RFC, CURP, Lugar donde nos encontró, ¿Tiene seguro?
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RFC'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CURP'),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lugar donde nos encontró'),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('Calle'),
                              value: 'Calle',
                            ),
                            DropdownMenuItem(
                              child: Text('Publicidad'),
                              value: 'Publicidad',
                            ),
                            DropdownMenuItem(
                              child: Text('Redes Sociales'),
                              value: 'Redes Sociales',
                            ),
                            DropdownMenuItem(
                              child: Text('Recomendación'),
                              value: 'Recomendación',
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('¿Tiene seguro?'),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('Sí'),
                              value: 'Sí',
                            ),
                            DropdownMenuItem(
                              child: Text('No'),
                              value: 'No',
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Botones
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
                      saveData();
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
