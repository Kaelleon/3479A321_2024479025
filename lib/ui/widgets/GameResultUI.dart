import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/game_result.dart';

class Gameresultui extends StatelessWidget
{
  final GameResult game;

  const Gameresultui({super.key, required this.game});
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Historial (Maqueta)')),
      body: Center
      (
        child:
        Card
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
                Text('Tiempo: ${game.timeSpent}')
              ],
            ),
          ),
        )
      ),
    );
  }
}