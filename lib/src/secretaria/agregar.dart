import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Agregar extends StatefulWidget {
  const Agregar({super.key});

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  final TextEditingController tarjeta = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController aPaterno = TextEditingController();
  final TextEditingController aMaterno = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController tipoPaciente = TextEditingController();
  //final TextEditingController edad = TextEditingController();
  final TextEditingController especialista = TextEditingController();
  final TextEditingController rfc = TextEditingController();
  final TextEditingController curp = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController fNacimiento = TextEditingController();
  final TextEditingController lugar = TextEditingController();
  //final TextEditingController dirección = TextEditingController();
  final TextEditingController seguro = TextEditingController();
  final TextEditingController tel = TextEditingController();
  //String? docId;
  //bool isLoading = false;
  //List<Map<String, dynamic>> historial = []; // Aquí guardaremos el historial

  Future<void> saveData() async {
    String idA = id.text;
    String tar = tarjeta.text;
    String ape = aPaterno.text;
    String ama = aMaterno.text;
    String nom = nombres.text;
    String tpe = tipoPaciente.text;
    //String edadE = edad.text;
    String esp = especialista.text;
    String rfE = rfc.text;
    String cur = curp.text;
    String sex = sexo.text;
    String fnG = fNacimiento.text;
    String seg = seguro.text;
    String lug = lugar.text;
    //String direccionH = direccion.text;
    String telI = tel.text;

    if (idA.isNotEmpty &&
        ape.isNotEmpty &&
        ama.isNotEmpty &&
        nom.isNotEmpty &&
        //edadE.isNotEmpty &&
        sex.isNotEmpty &&
        fnG.isNotEmpty &&
        //direccionH.isNotEmpty &&
        telI.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('paciente').doc(idA).set({
          'id': idA,
          'tarjeta': tar,
          'apellido paterno': aPaterno,
          'apellido materno': aMaterno,
          'nombre(s)': nombres,
          'tipoPciente': tpe,
          'especialista': esp,
          'rfc': rfE,
          'curp': cur,
          'seguro': seg,
          'lugar': lug,
          //'edad': edadE,
          'sexo': sex,
          'fecha nacimiento': fnG,
          //'direccion': direccionH,
          'tel': telI
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: saveData,
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
                      // Acción de salir
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
      ),
    );
  }
}
