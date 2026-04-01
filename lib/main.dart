import 'package:flutter/material.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Buscamina',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MinesweeperScreen(),
    );
  }
}

class MinesweeperScreen extends StatelessWidget 
{
    const MinesweeperScreen({Key? key}) : super(key: key);
    @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Buscaminas')),
      body: SafeArea
      ( // Protege la UI de los bordes del dispositivo
        child: Column
        ( // Apila el marcador arriba y el tablero abajo
          children: 
          [
            // Área de Status
            Container
            (
              height: 60,
              color: const Color.fromARGB(255, 131, 96, 237),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [ 
                  Row
                  (
                    children: 
                    [
                      Icon(Icons.timer),
                      SizedBox(width: 5),
                      Text('349s',
                      style: TextStyle
                      (
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  Row
                  (
                    children: 
                    [
                      Icon(Icons.warning),
                      SizedBox(width: 5),
                      Text('10',
                      style: TextStyle
                      (
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  Row
                  (
                    children: 
                    [
                      Icon(Icons.grid_on),
                      SizedBox(width: 5),
                      Text('56',
                      style: TextStyle
                      (
                       fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ]
              ),
              
            ),
              const Divider(height: 1),
              // Área de Juego
              Expanded
            ( // Expande el tablero para llenar la pantalla
              child: _gameBoard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard() 
  {
    return Center
    (
      child: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio
        (
          aspectRatio: 1.0, // Cuadrado perfecto
          child: GridView.builder
          (
            physics: const NeverScrollableScrollPhysics(), // Bloquea el scroll
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
            (
              crossAxisCount: 8, // 8 columnas
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            
            itemCount: 64, // 8x8 = 64 celdas
            itemBuilder: (context, index) 
            {
              return MineCell(index: index);
            },
          ),
        ),
      ),
    );
  }
}

class MineCell extends StatelessWidget 
{
  final int index;
  const MineCell
  ({
    Key? key,
    required this.index, // Parámetro obligatorio en el constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        color: const Color.fromARGB(255, 118, 190, 249),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
    );
  }
}
