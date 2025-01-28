import 'package:flutter/material.dart'; // Importa el paquete material de Flutter para usar widgets básicos y diseño

// Define la clase principal del widget para la aplicación
class TurneroApp extends StatefulWidget {
  @override
  // Crea el estado de la clase TurneroApp
  State<TurneroApp> createState() => _TurneroAppState();
}

// La clase que define el estado para el widget TurneroApp
class _TurneroAppState extends State<TurneroApp> {
  @override
  // Método de construcción del widget
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Elimina el banner de modo de depuración
      title: 'Turnero', // Establece el título de la aplicación
      theme: ThemeData(
          primarySwatch: Colors
              .blue), // Define el tema de la aplicación con un color azul principal
      home:
          TurneroScreen(), // Establece la pantalla principal como TurneroScreen
    );
  }
}

// Define la clase TurneroScreen que contiene la pantalla principal de la aplicación
class TurneroScreen extends StatefulWidget {
  @override
  // Crea el estado para la pantalla TurneroScreen
  _TurneroScreenState createState() => _TurneroScreenState();
}

// La clase que define el estado para la pantalla TurneroScreen
class _TurneroScreenState extends State<TurneroScreen> {
  int currentTurn = 0; // Mantiene el turno actual que se está mostrando
  List<int> turnQueue =
      []; // Cola de turnos, lista que guarda los turnos solicitados

  // Función para tomar un nuevo turno
  void takeTurn() {
    setState(() {
      // Si la cola está vacía, el primer turno será 1, sino se sigue el último turno + 1
      int nextTurn = turnQueue.isEmpty ? 1 : turnQueue.last + 1;
      turnQueue.add(nextTurn); // Añade el nuevo turno a la cola
    });
  }

  // Función para pasar al siguiente turno
  void nextTurn() {
    setState(() {
      // Si la cola no está vacía, avanzamos al siguiente turno en la cola
      if (turnQueue.isNotEmpty && currentTurn < turnQueue.length) {
        currentTurn++; // Avanza al siguiente turno
      }
    });
  }

  @override
  // Método de construcción del widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Turnero'), // Establece el título de la barra de la aplicación
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Alinea el contenido al centro de la pantalla
        children: [
          Text(
            'Turno Actual:', // Texto que indica el turno actual
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold), // Estilo del texto
          ),
          SizedBox(height: 20), // Espaciado entre widgets
          Text(
            currentTurn == 0 || currentTurn > turnQueue.length
                ? 'Ninguno' // Si no hay turno, muestra 'Ninguno'
                : '#${turnQueue[currentTurn - 1]}', // Muestra el turno actual
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue), // Estilo del número de turno
          ),
          SizedBox(height: 40), // Espaciado entre widgets
          ElevatedButton(
            onPressed:
                takeTurn, // Al presionar el botón, se ejecuta la función takeTurn
            child: Text('Tomar Turno'), // Texto del botón
          ),
          SizedBox(height: 20), // Espaciado entre botones
          ElevatedButton(
            onPressed:
                nextTurn, // Al presionar el botón, se ejecuta la función nextTurn
            child: Text('Siguiente Turno'), // Texto del botón
          ),
          SizedBox(height: 40), // Espaciado entre widgets
          Text(
            'Próximos Turnos:', // Texto que indica los próximos turnos
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold), // Estilo del texto
          ),
          Expanded(
            child: ListView.builder(
              itemCount: turnQueue
                  .length, // Define la cantidad de elementos en la lista
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Turno #${turnQueue[index]}', // Muestra el número de turno en cada fila
                    style: TextStyle(
                        fontSize: 18), // Estilo del texto de cada turno
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
