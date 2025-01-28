// Importaciones de paquetes y otros archivos
import 'package:flutter/material.dart'; // Importa las herramientas de diseño y material de Flutter
import 'package:residencia_cepamm/src/secretaria/agregar.dart'; // Importa la página para agregar un registro
import 'package:residencia_cepamm/src/secretaria/consultar.dart'; // Importa la página para consultar datos
import 'package:residencia_cepamm/src/secretaria/modificar.dart'; // Importa la página para modificar registros

// Clase que crea una página de inicio como StatefulWidget
class Inicio extends StatefulWidget {
  const Inicio(
      {super.key}); // Constructor para la clase, con super.key como parámetro

  @override
  State<Inicio> createState() =>
      _InicioState(); // Crea el estado asociado a la clase Inicio
}

// Clase que contiene el estado de la pantalla Inicio
class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold es una estructura básica de diseño para una pantalla
      appBar: AppBar(
        // Barra superior de la pantalla
        title: const Text('funfación CEPAMM'), // Título de la app en la barra
        backgroundColor:
            Colors.lightBlue, // Color de fondo de la barra superior
      ),
      drawer: Drawer(
        // Panel de navegación lateral
        child: ListView(
          // Lista de elementos en el menú lateral
          padding: EdgeInsets.zero, // No agrega espacio adicional
          children: [
            DrawerHeader(
              // Encabezado del menú lateral
              decoration: const BoxDecoration(
                color: Colors.lightBlue, // Color de fondo del encabezado
              ),
              child: Column(
                // Contenido del encabezado
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alineación del contenido
                children: [
                  Image.asset(
                    // Imagen que se muestra en el encabezado
                    'assets/sin.png',
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(height: 10), // Espacio entre elementos
                  const Text(
                    'fundación CEPAMM', // Título debajo de la imagen
                    style: TextStyle(
                      color: Colors.white, // Color del texto
                      fontSize: 15, // Tamaño del texto
                      fontWeight: FontWeight.bold, // Estilo de texto en negrita
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              // Elemento del menú que lleva a la pantalla de Agenda
              leading: const Icon(
                  Icons.calendar_today), // Icono que representa la agenda
              title: const Text('Agenda'), // Título del elemento
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
            ListTile(
              // Elemento del menú que abre un modal con la página de Pacientes
              leading: const Icon(Icons.person), // Icono de pacientes
              title: const Text('Pacientes'), // Título del elemento
              onTap: () {
                showDialog(
                  // Muestra un cuadro de diálogo
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      // Diálogo con diseño personalizado
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Bordes redondeados
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Ancho del modal
                        height: MediaQuery.of(context).size.height *
                            0.8, // Altura del modal
                        child:
                            PacientesPage(), // Muestra la página de pacientes
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              // Elemento para ir a la página de Dashboard
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
            ListTile(
              // Elemento para ir a la página de Laboratorios
              leading: const Icon(Icons.science),
              title: const Text('Laboratorios'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
            ListTile(
              // Elemento para ir a la página de Gastos
              leading: const Icon(Icons.attach_money),
              title: const Text('Gastos'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
            ListTile(
              // Elemento para ir a la página de Usuarios
              leading: const Icon(Icons.group),
              title: const Text('Usuarios'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
            ListTile(
              // Elemento para ir a la página de Ingresos y Cobros
              leading: const Icon(Icons.monetization_on),
              title: const Text('Ingresos y Cobros'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
            ListTile(
              // Elemento para ir a la página de Reportes
              leading: const Icon(Icons.bar_chart),
              title: const Text('Reportes'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral al tocar
              },
            ),
          ],
        ),
      ),
      body: Center(
        // Contenido principal de la pantalla
        child: Image.asset(
          // Muestra una imagen en el centro de la pantalla
          'assets/sin.png',
          width: 600, // Establece el ancho de la imagen
        ),
      ),
    );
  }
}

// Clase que crea la página de Pacientes
class PacientesPage extends StatelessWidget {
  const PacientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Aplica un padding de 20 píxeles alrededor de todo el contenido
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // Columna para organizar los elementos
        children: [
          Row(
            // Fila con elementos alineados de manera espaciada
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pacientes', // Título de la sección
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                // Botón para cerrar el modal
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el modal al presionar
                },
              ),
            ],
          ),
          const Divider(), // Línea divisoria
          Expanded(
            // Se asegura de que el contenido ocupe el espacio disponible
            child: SingleChildScrollView(
              // Permite desplazarse si el contenido es extenso
              child: Center(
                // Centra el contenido en la pantalla
                child: Column(
                  // Columna que contiene los botones de acción
                  children: [
                    Image.asset(
                      // Imagen mostrada en la página de pacientes
                      'assets/sin.png',
                      width: 300,
                    ),
                    const SizedBox(height: 20), // Espacio entre los elementos
                    BotonPrincipal(
                      // Botón para agregar un nuevo registro
                      texto: "Añadir Registro",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Agregar())); // Navega a la página de agregar
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      // Botón para consultar datos
                      texto: "Consultar Datos",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Consultar())); // Navega a la página de consultar
                      },
                    ),
                    const SizedBox(height: 20),
                    BotonPrincipal(
                      // Botón para editar un registro
                      texto: "Editar Registro",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Modificar())); // Navega a la página de modificar
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

// Widget personalizado para los botones principales
class BotonPrincipal extends StatelessWidget {
  final String texto; // Texto del botón
  final VoidCallback
      onPressed; // Acción que se ejecuta cuando el botón es presionado

  const BotonPrincipal(
      {required this.texto, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Crea un botón elevado
      onPressed: onPressed, // Asigna la acción al presionar el botón
      style: ElevatedButton.styleFrom(
        // Estilo del botón
        backgroundColor: Colors.lightBlue, // Color de fondo del botón
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 15), // Espaciado dentro del botón
        shape: RoundedRectangleBorder(
          // Define los bordes redondeados
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        // Texto que se muestra en el botón
        texto,
        style: const TextStyle(
            color: Colors.black, fontSize: 16), // Estilo del texto
      ),
    );
  }
}
