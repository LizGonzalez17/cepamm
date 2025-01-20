import 'package:flutter/material.dart';



class TurneroApp extends StatefulWidget {
  @override
  State<TurneroApp> createState() => _TurneroAppState();
}

class _TurneroAppState extends State<TurneroApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turnero',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TurneroScreen(),
    );
  }
}

class TurneroScreen extends StatefulWidget {
  @override
  _TurneroScreenState createState() => _TurneroScreenState();
}

class _TurneroScreenState extends State<TurneroScreen> {
  int currentTurn = 0; // Mantiene el turno actual que se está mostrando
  List<int> turnQueue = []; // Cola de turnos

  void takeTurn() {
    setState(() {
      // Si la cola está vacía, el primer turno será 1, sino se sigue el último turno + 1
      int nextTurn = turnQueue.isEmpty ? 1 : turnQueue.last + 1;
      turnQueue.add(nextTurn);
    });
  }

  void nextTurn() {
    setState(() {
      // Si la cola no está vacía, avanzamos al siguiente turno en la cola
      if (turnQueue.isNotEmpty && currentTurn < turnQueue.length) {
        currentTurn++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turnero'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Turno Actual:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            currentTurn == 0 || currentTurn > turnQueue.length
                ? 'Ninguno'
                : '#${turnQueue[currentTurn - 1]}', // Muestra el turno actual
            style: TextStyle(
                fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: takeTurn,
            child: Text('Tomar Turno'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: nextTurn,
            child: Text('Siguiente Turno'),
          ),
          SizedBox(height: 40),
          Text(
            'Próximos Turnos:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: turnQueue.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Turno #${turnQueue[index]}',
                    style: TextStyle(fontSize: 18),
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
