import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/settings_view_model.dart';
import 'package:flutter_application_1/ui/widgets/mine_cell.dart';
import 'package:flutter_application_1/models/cell_model.dart';
import 'package:logger/logger.dart';
import 'package:flutter_application_1/models/game_view_model.dart';
import 'package:provider/provider.dart';

final logger = Logger();

class MinesweeperScreen extends StatelessWidget 
{
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    final viewModel = context.watch<GameViewModel>();
    final realGridSize = viewModel.gridSize;
    final settingsVM = context.watch<SettingsViewModel>();
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
                      Text('${viewModel.secondsElapsed}s',
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
              child: _gameBoard(viewModel),
            ),
            Text('Dificultad: ${settingsVM.difficulty}'),
            Text('Tamaño: ${realGridSize}x$realGridSize'),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard(GameViewModel viewModel)
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (
              crossAxisCount: viewModel.gridSize,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            
            itemCount: viewModel.cells.length, // 8x8 = 64 celdas
            itemBuilder: (context, index) 
            {
              final currentCell = viewModel.cells[index];
              return MineCell(index: index, cell: currentCell, onTap: () => viewModel.revealCell(index),); // Cada celda es un widget MineCell
            },
          ),
        ),
      ),
    );
  }
}


