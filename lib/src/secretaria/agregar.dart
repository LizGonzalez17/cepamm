import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Agregar extends StatefulWidget {
  const Agregar({Key? key}) : super(key: key);

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  final TextEditingController tarjeta = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController ap = TextEditingController();
  final TextEditingController am = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController edadE = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController fn = TextEditingController();
  final TextEditingController direccionH = TextEditingController();
  final TextEditingController tel = TextEditingController();
  final TextEditingController tipoPaciente = TextEditingController();
  final TextEditingController especialista = TextEditingController();
  final TextEditingController rfc = TextEditingController();
  final TextEditingController curp = TextEditingController();
  final TextEditingController lugar = TextEditingController();
  final TextEditingController seguro = TextEditingController();

  Future<void> saveData() async {
    String tar = tarjeta.text;
    String idA = id.text;
    String apB = ap.text;
    String amC = am.text;
    String nombresD = nombres.text;
    String edad = edadE.text; //
    String fnG = fn.text;
    String dir = direccionH.text; //
    String telI = tel.text; //
    String tp = tipoPaciente.text;
    String esp = especialista.text;
    String rf = rfc.text;
    String cur = curp.text;
    String lug = lugar.text;
    String seg = seguro.text;
    String sex = sexo.text;

    if (tar.isNotEmpty &&
        idA.isNotEmpty &&
        apB.isNotEmpty &&
        amC.isNotEmpty &&
        sex.isNotEmpty &&
        nombresD.isNotEmpty &&
        edad.isEmpty &&
        fnG.isNotEmpty &&
        dir.isNotEmpty &&
        telI.isNotEmpty &&
        tp.isNotEmpty &&
        esp.isNotEmpty &&
        rf.isNotEmpty &&
        cur.isNotEmpty &&
        lug.isNotEmpty &&
        seg.isNotEmpty &&
        sex.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('paciente').doc(idA).set({
          'tarjeta': tar,
          'id': idA,
          'apellido paterno': apB,
          'apellido materno': amC,
          'sexo': sex,
          'nombre(s)': nombresD,
          'edadE': edad, //
          'fecha nacimiento': fnG,
          'direccion': direccionH, //
          'tel': telI, //
          'tipoPaciente': tp,
          'especialista': esp,
          'rfc': rf,
          'curp': cur,
          'lugar': lug,
          'seguro': seg,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar el paciente: $e')),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Número de tarjeta'),
                        TextFormField(
                          controller: tarjeta,
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
                          controller: nombres,
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
                          controller: ap,
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
                          controller: am,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Edad'),
                        TextFormField(
                          controller: edadE,
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
                        Text('Dirección'),
                        TextFormField(
                          controller: direccionH,
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
                        Text('Teléfono'),
                        TextFormField(
                          controller: tel,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
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
                          onChanged: (value) {
                            setState(() {
                              tipoPaciente.text = value ?? '';
                            });
                          },
                          value: tipoPaciente.text.isEmpty
                              ? null
                              : tipoPaciente.text,
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
                          onChanged: (value) {
                            setState(() {
                              especialista.text = value ?? '';
                            });
                          },
                          value: especialista.text.isEmpty
                              ? null
                              : especialista.text,
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
                          controller: fn,
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
                          onChanged: (value) {
                            setState(() {
                              sexo.text = value ?? '';
                            });
                          },
                          value: sexo.text.isEmpty ? null : sexo.text,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RFC'),
                        TextFormField(
                          controller: rfc,
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
                          controller: curp,
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
                          onChanged: (value) {
                            setState(() {
                              lugar.text = value ?? '';
                            });
                          },
                          value: lugar.text.isEmpty ? null : lugar.text,
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
                          onChanged: (value) {
                            setState(() {
                              seguro.text = value ?? '';
                            });
                          },
                          value: seguro.text.isEmpty ? null : seguro.text,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text('Guardar Datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
