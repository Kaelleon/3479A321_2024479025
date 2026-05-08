import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/mine_cell.dart';
import 'package:flutter_application_1/models/cell_model.dart';
import 'package:logger/logger.dart';

class MinesweeperScreen extends StatefulWidget 
{
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  State<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends State<MinesweeperScreen> 
{
  late List<CellModel> _cells;
  final logger = Logger();

  @override
  void initState() 
  {
    super.initState();
    // 1. Inicializamos el estado del tablero
    _cells = List.generate(64, (i) => CellModel(index: i));
    logger.i('Lifecycle: initState() - El estado ha sido creado.');
  }

  @override
  void didChangeDependencies() 
  {
    super.didChangeDependencies();
    logger.i('Lifecycle: didChangeDependencies() - Contexto listo o dependencias cambiadas.');
  }

  // 3. ACTUALIZACIÓN: Se llama cada vez que el widget padre envía nuevos parámetros.
  @override
  void didUpdateWidget(covariant MinesweeperScreen oldWidget) 
  {
    super.didUpdateWidget(oldWidget);
    logger.w('Lifecycle: didUpdateWidget() - La configuración del widget ha cambiado.');
  }

  // 4. DESTRUCCIÓN: Se llama cuando el widget se elimina permanentemente (ej. al hacer Pop).
  @override
  void dispose() 
  {
    logger.e('Lifecycle: dispose() - El estado se destruye. Liberando memoria.');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    final args =ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Definimos valores por defecto (Fallback) en caso de que lleguen nulos
    final String difficulty = args?['difficulty'] ?? 'Desconocida'; 
    final int gridSize = args?['gridSize'] ?? 8;
    return Scaffold
    (
      appBar: AppBar(title: const Text('Buscaminas'),
      actions: 
      [
        IconButton
        (
          icon: const Icon(Icons.person_outline),
          onPressed: () 
          {
          // Aquí podrías navegar a una pantalla de "Acerca de"
          Navigator.pushNamed(context, '/about');
          },
        ),
        IconButton
        (
          icon: const Icon(Icons.history_edu),
          onPressed:  ()
          {
            Navigator.pushNamed(context, '/history');
          },
        ),
        IconButton
        (
          icon: const Icon(Icons.menu),
          onPressed: ()
          {
            Navigator.pushNamed(context, '/menu');
          },
        ),
      ]
      ),

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
                      Image.asset('assets/images/Tiempo.png'),
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
                      Image.asset('assets/images/Bomba.png'),
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
                      Image.asset('assets/images/Bandera.png'),
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
            Text('Dificultad: $difficulty'),
            Text('Tamaño: $gridSize'),
          ],
        ),
      ),
    );
  }

  void _onCellTapped(int index) 
  {
    setState(() 
    {
      _cells[index].isRevealed = true; // Actualizamos el dato
    });
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
              return MineCell(index: index, cell: _cells[index], onTap: () => _onCellTapped(index),); // Cada celda es un widget MineCell
            },
          ),
        ),
      ),
    );
  }
}
