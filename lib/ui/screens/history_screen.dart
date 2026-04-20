import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/game_result.dart';
import 'package:flutter_application_1/ui/widgets/GameResultUI.dart';

class HistoryScreen extends StatelessWidget 
{
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    final List<GameResult> listMaqueta = 
    [
      GameResult(date: '10 Abr', timeSpent: '01:20', isVictory: true, difficulty: 'Fácil'),
      GameResult(date: '09 Abr', timeSpent: '04:45', isVictory: false, difficulty:'Difícil'),
      GameResult(date: '08 Abr', timeSpent: '02:10', isVictory: true, difficulty: 'Medio'),
      GameResult(date: '07 Abr', timeSpent: '01:40', isVictory: false, difficulty: 'Dificil'),
      GameResult(date: '01 May', timeSpent: '01:00', isVictory: true, difficulty: 'Facil'),
      GameResult(date: '20 Abr', timeSpent: '01:30', isVictory: false, difficulty: 'Medio'),
      GameResult(date: '28 Mar', timeSpent: '03:40', isVictory: true, difficulty: 'Dificil'),
      GameResult(date: '07 Jun', timeSpent: '00:50', isVictory: false, difficulty: 'Facil'),
      GameResult(date: '20 May', timeSpent: '02:20', isVictory: false, difficulty: 'Medio'),
      GameResult(date: '25 May', timeSpent: '00:40', isVictory: true, difficulty: 'Dificil'),
    ];
    return Scaffold
    (
      appBar: AppBar(title: const Text('Historial (Maqueta)')),
      body:
      ListView.builder(itemBuilder: (context, index) 
      {
        final game = listMaqueta[index];
        return GameResultUI(game: game); // GameResultUI es el widget personalizado que creamos en los pasos anteriores (refactor)
      },
      itemCount: listMaqueta.length,
      ),
    );
  }
} 