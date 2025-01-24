import 'package:flutter/material.dart';
import 'package:residencia_cepamm/src/secretaria/agregar.dart';
import 'package:residencia_cepamm/src/secretaria/consultar.dart';
import 'package:residencia_cepamm/src/secretaria/modificar.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('funfación CEPAMM'),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/sin.png',
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'fundación CEPAMM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Agenda'),
              onTap: () {
                // Navegación a Agenda
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Pacientes'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child:
                            PacientesPage(), // Aquí llamas directamente a tu página de pacientes
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Navegación a Dashboard
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.science),
              title: const Text('Laboratorios'),
              onTap: () {
                // Navegación a Laboratorios
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Gastos'),
              onTap: () {
                // Navegación a Gastos
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Usuarios'),
              onTap: () {
                // Navegación a Usuarios
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text('Ingresos y Cobros'),
              onTap: () {
                // Navegación a Ingresos y Cobros
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Reportes'),
              onTap: () {
                // Navegación a Reportes
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/sin.png',
          width: 600,
        ),
      ),
    );
  }
}

class PacientesPage extends StatelessWidget {
  const PacientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pacientes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el modal
                },
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/sin.png',
                      width: 300,
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      texto: "Añadir Registro",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Agregar()));
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      texto: "Consultar Datos",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Consultar()));
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      texto: "Editar Registro",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Modificar()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para los botones principales
class BotonPrincipal extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotonPrincipal(
      {required this.texto, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
