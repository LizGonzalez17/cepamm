import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Consultarmturno extends StatefulWidget {
  const Consultarmturno({super.key});

  @override
  State<Consultarmturno> createState() => _ConsultarmturnoState();
}

class _ConsultarmturnoState extends State<Consultarmturno> {
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

  String? _selectedSpecialty;

  final List<String> specialties = [
    'Ginecología',
    'Dentista',
    'Pediatría',
    'Cardiología',
    'Oftalmología',
    'Dermatología',
    'Medicina General',
  ];

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
              content:
                  Text('No se encontró el paciente con el CURP ingresado')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al buscar paciente: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> modificar() async {
    if (docId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Primero consulta un registro')),
      );
      return;
    }

    if (_selectedSpecialty == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona una especialidad')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Guardar la especialidad en el campo 'consultas'
      await FirebaseFirestore.instance
          .collection('paciente')
          .doc(docId)
          .update({
        'nombre(s)': nombres.text.trim(),
        'apellido paterno': ap.text.trim(),
        'apellido materno': am.text.trim(),
        'edad': edad.text.trim(),
        'sexo': sexo.text.trim(),
        'fecha nacimiento': fn.text.trim(),
        'direccion': direccion.text.trim(),
        'tel': tel.text.trim(),
        'consultas': {
          'especialidad':
              _selectedSpecialty, // Guardar la especialidad como un campo dentro de 'consultas'
          'fecha_registro': DateTime
              .now(), // Puedes guardar la fecha del registro de la especialidad si es necesario
        },
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos actualizados exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al modificar datos: $e')),
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
      appBar: AppBar(),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'fundación CEPAMM\nMÓDULO DE MODIFICACIONES',
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
                ElevatedButton(
                  onPressed: buscar,
                  child: const Text('Consultar'),
                ),
                const SizedBox(height: 16),
                // Campos no editables
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
                            enabled: false, // Deshabilitar escritura
                          ),
                          TextField(
                            controller: nombres,
                            decoration: InputDecoration(hintText: "Nombre(s)"),
                            enabled: false, // Deshabilitar escritura
                          ),
                          TextField(
                            controller: sexo,
                            decoration: InputDecoration(hintText: "Sexo"),
                            enabled: false, // Deshabilitar escritura
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
                            enabled: false, // Deshabilitar escritura
                          ),
                          TextField(
                            controller: edad,
                            decoration: InputDecoration(hintText: "Edad"),
                            enabled: false, // Deshabilitar escritura
                          ),
                          TextField(
                            controller: fn,
                            decoration: InputDecoration(
                                hintText: "Fecha de nacimiento"),
                            enabled: false, // Deshabilitar escritura
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: direccion,
                            decoration: InputDecoration(hintText: "Dirección"),
                            enabled: false, // Deshabilitar escritura
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
                            enabled: false, // Deshabilitar escritura
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Seleccione la especialidad a la que asistirá:',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: DropdownButton<String>(
                                  value: _selectedSpecialty,
                                  hint: Text(
                                    'Seleccione una opción',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedSpecialty = newValue;
                                    });
                                  },
                                  isExpanded: true,
                                  items: specialties
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 50),
                              ElevatedButton(
                                onPressed: () {
                                  if (_selectedSpecialty != null) {
                                    // Mostrar confirmación
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Selección confirmada'),
                                          content: Text(
                                              'Has seleccionado $_selectedSpecialty'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                modificar();
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Aceptar',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    // Mostrar error si no selecciona especialidad
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Por favor, selecciona una especialidad'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Aceptar'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                ),
                                child: Text('Confirmar'),
                              ),
                            ],
                          ),
                        ],
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
