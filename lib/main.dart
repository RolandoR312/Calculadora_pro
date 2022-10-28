import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Rolando R.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora básica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
 }
 // enum
enum Operacion {sumar, restar, multiplicar, dividir}

class _MyHomePageState extends State<MyHomePage> {
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();
  int _total = 0;

  void _calcular(Enum operacion){
    setState(() {
      switch(operacion){
        case Operacion.sumar : _total = int.parse(_numero1.text) + int.parse(_numero2.text);
        break;
        case Operacion.restar : _total = int.parse(_numero1.text) - int.parse(_numero2.text);
        break;
        case Operacion.multiplicar : _total = int.parse(_numero1.text) * int.parse(_numero2.text);
        break;
        // Para Dividir números enteros, simbolo ~/ (Alt + 126)
        case Operacion.dividir : _total = int.parse(_numero1.text) ~/ int.parse(_numero2.text);
        break;
      }
     });
  }
  void limpiar() => setState(() {
        _numero1.text = "";
        _numero2.text = "";
        _total = 0;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Center(
            child: Column(
              children: <Widget>[
                // Agregar el código
                TextFormField(
                  controller: _numero1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ingrese el primer número:  '),
                ),

                // Espaciado a los widget
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _numero2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ingrese el segundo número:  '),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // Espaciado a los widget
                const SizedBox(
                  width: 10.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Quitar el Icon del ElevatedButton
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          _calcular(Operacion.sumar);
                        },
                        child: const Text('+'),
                      ),

                      const SizedBox(
                        width: 10.0,
                      ),

                      ElevatedButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        // icon: const Icon(Icons.calculate, size: 20);
                        onPressed: () {
                          _calcular(Operacion.restar);
                        },

                        child: const Text('-'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        // icon: const Icon(Icons.calculate, size: 20);
                        onPressed: () {
                          _calcular(Operacion.multiplicar);
                        },

                        child: const Text('x'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        // icon: const Icon(Icons.calculate, size: 20);
                        onPressed: () {
                          _calcular(Operacion.dividir);
                        },
                        child: const Text('÷'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ]),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  // Cambiar _suma por _total
                  'El resultado de la OPERACION es:  $_total',
                  // Cambiar los estilos
                  // style: Theme.of(context).textTheme.headline4,
                  style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle
                          .italic // Texto ubicado debajo de la barra lateral
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                ElevatedButton(
                  child: Text(
                    "Limpiar",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: limpiar,
                ),
              ],
            ), // Column
          ), // Center
        ));
        }
      }
