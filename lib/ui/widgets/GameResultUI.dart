import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/game_result.dart';

class GameResultUI extends StatelessWidget
{
  final GameResult game;

  const GameResultUI({super.key, required this.game});
  @override
  Widget build(BuildContext context) 
  {
    return Card
    (
      elevation: 4,
      child: Padding
      (
        padding: const EdgeInsets.all(16.0),
        child: Column
        (
          mainAxisSize: MainAxisSize.min,
          children: 
          [
            Text('Fecha: ${game.date}'),
            Text('Tiempo: ${game.timeSpent}'),
            Text('Dificultad: ${game.difficulty}'),
            Text(game.isVictory ? 'Victoria':'Derrota'),
          ],
        ),
      ),
    );
  }
}