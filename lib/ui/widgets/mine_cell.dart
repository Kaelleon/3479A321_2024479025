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
          color: theme.colorScheme.secondary, //usa el color de fonde del tema
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
    if (!cell.isRevealed) 
    {
      return const SizedBox.shrink();
    }
    if (cell.isBomb) 
    {
      return Image.asset
      (
        'assets/icons/Mina.png',
        width: 40, // Ajustamos el tamaño para que no desborde
        height: 40,
        fit: BoxFit.contain,
      );
    }
    return Text
    (
      '${cell.index}',
      style: const TextStyle
      (
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }
}
