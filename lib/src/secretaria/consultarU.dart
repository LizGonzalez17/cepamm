import 'package:flutter/material.dart';

class Consultaru extends StatefulWidget {
  const Consultaru({super.key});

  @override
  State<Consultaru> createState() => _ConsultaruState();
}

class _ConsultaruState extends State<Consultaru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MÓDULO DE CONSULTAS USUARIO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título principal
            const Center(),
            const SizedBox(height: 16),
            // Campos de texto y lista de consultas
            Expanded(
              child: Row(
                children: [
                  // Columna de campos de texto
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextField(
                          decoration: InputDecoration(labelText: 'Apellidos:'),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(labelText: 'Nombre:'),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(labelText: 'Edad:'),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(labelText: 'Sexo:'),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(labelText: 'Dirección:'),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Teléfono celular:'),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Fecha nacimiento:'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Lista de consultas
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.account_circle),
                            title: const Text('Consulta tipo Fecha'),
                            trailing: const Icon(Icons.check_circle,
                                color: Colors.green),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.account_circle),
                            title: const Text('Consulta tipo Fecha'),
                            trailing: const Icon(Icons.check_circle,
                                color: Colors.green),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.account_circle),
                            title: const Text('Consulta tipo Fecha'),
                            trailing: const Icon(Icons.check_circle_outline,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Cuadro de descuento especial
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Con el objetivo de apoyar a nuestros pacientes más frecuentes, '
                  'le ofrecemos un descuento del 10% como muestra de agradecimiento '
                  'por su confianza y preferencia.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
