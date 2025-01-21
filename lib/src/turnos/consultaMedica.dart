import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultaPage extends StatefulWidget {
  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
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
  Future<void> saveData() async {
    String? especialidad = _selectedSpecialty;

    if (especialidad!.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('paciente').doc('1').set({
          'especialidad': especialidad,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('¿A qué consulta se dirigue?'),
        backgroundColor: const Color.fromARGB(255, 110, 219, 235),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 226, 89, 194),
              const Color.fromARGB(255, 231, 47, 185)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
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
                items:
                    specialties.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 14, 14, 14),
                          fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (_selectedSpecialty != null) {
                  // Confirmar selección con mensaje
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Selección confirmada'),
                        content: Text('Has seleccionado $_selectedSpecialty'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Aceptar',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 37, 38, 38),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Mostrar advertencia si no se selecciona especialidad
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Por favor, selecciona una especialidad'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              saveData();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Aceptar',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 96, 218, 240),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 90, 208, 231),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Confirmar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
