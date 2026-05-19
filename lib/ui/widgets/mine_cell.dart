import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cell_model.dart';

class MineCell extends StatelessWidget 
{
  final int index;
  final CellModel cell;
  final VoidCallback onTap;

  const MineCell
  ({
    Key? key,
    required this.index,
    required this.cell, // Recibe el estado de esta celda específica
    required this.onTap, // Recibe la función que debe ejecutar al ser tocada
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    final theme = Theme.of(context);

    return GestureDetector
    (
      onTap: onTap,
      child: Container
      (
        decoration: BoxDecoration
        (
          color:
          cell.isRevealed
          ? Colors.grey[100]
          : theme.colorScheme.secondary, //usa el color de fonde del tema,

          border: Border.all(color: theme.colorScheme.outline, width: 1.5),
        ),
        child: Center
        (
          child: _buildCellContent()
        )
      ),
    );
  }

 Widget _buildCellContent() 
 {
    if (!cell.isRevealed) return const SizedBox.shrink();
    if (cell.isBomb) return Image.asset('assets/icons/Mina.png', width: 24, height: 24);
    if (cell.adjacentMines == 0) return const SizedBox.shrink();

    // Paleta de colores clásica
    Color numberColor;
    switch (cell.adjacentMines) 
    {
      case 1: numberColor = Colors.blue; break;
      case 2: numberColor = Colors.green; break;
      case 3: numberColor = Colors.red; break;
      case 4: numberColor = Colors.purple; break;
      case 5: numberColor = Colors.brown; break;
      default: numberColor = Colors.black87;
    }

    return Text
    (
      '${cell.adjacentMines}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color:
      numberColor),
    );
  }
}
