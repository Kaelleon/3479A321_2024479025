import 'dart:async';
import 'package:flutter/material.dart';
import '../models/cell_model.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:logger/logger.dart';

class GameViewModel extends ChangeNotifier 
{
  List<CellModel> _cells = List.generate(64, (i) => CellModel(index: i));
  List<CellModel> get cells => _cells;

  bool _isGameOver = false; // Estado de la partida
  bool get isGameOver => _isGameOver;

  // Variables del Reloj
  Timer? _timer;
  int secondsElapsed = 0;
  bool _isFirstTap = true;

  final int gridSize;
  late int totalCells;

  final AudioPlayer _sfxPlayer = AudioPlayer();

  final Logger _logger = Logger();

  StreamSubscription? _accelerometerSubscription;

  GameViewModel({required this.gridSize})
  {
    totalCells = gridSize * gridSize;
    _generateBoard();
    _initAccelerometer();
  }

  void revealCell(int index) 
  {
    if (_isFirstTap) 
    {
      _startTimer();
      _isFirstTap = false;
    }

    if (_isGameOver || _cells[index].isRevealed) return;
    _cells[index].isRevealed = true;

    // Si toca una bomba, el juego termina
    if (_cells[index].isBomb) 
    {
      _playSound('Explosion.mp3'); // SONIDO DE DERROTA
      _isGameOver = true;
      _timer?.cancel();
      _revealAll(); // Función para mostrar todo al mori.
    }
    else
    {
      _playSound('Tap.mp3'); // SONIDO DE CELDA SEGURA
    }
    notifyListeners();
  }

  void _revealAll()
  {
    for (var cell in _cells)
    {
      cell.isRevealed = true;
    }
  }

  void _generateBoard() 
  {
    // 1. Creamos las 64 celdas vacías
    _cells = List.generate(totalCells, (i) => CellModel(index: i));

    // 2. Sembrar 10 bombas aleatorias
    Random random = Random();
    int bombsPlanted = 0;

    while (bombsPlanted < 10) 
    {
      int index = random.nextInt(totalCells);
      if (!_cells[index].isBomb) 
      {
        _cells[index].isBomb = true;
        bombsPlanted++;
      }
    }

    _calculateAdjacentMines();
  }

  void _calculateAdjacentMines() 
  {
    for (int i = 0; i < _cells.length; i++) 
    {
      if (_cells[i].isBomb) continue;
      int row = i ~/ gridSize;
      int col = i % gridSize;
      int count = 0;
      for (int r = -1; r <= 1; r++) 
      {
        for (int c = -1; c <= 1; c++) 
        {
          if (r == 0 && c == 0) continue;
          int newRow = row + r;
          int newCol = col + c;
          if (newRow >= 0 && newRow < gridSize && newCol >= 0 && newCol <
          gridSize) 
          {
            int neighborIndex = (newRow * gridSize) + newCol;
            if (_cells[neighborIndex].isBomb) count++;
          }
        }
      }
      _cells[i].adjacentMines = count;
    }
  }

  void _startTimer() 
  {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) 
    {
      secondsElapsed++;
      notifyListeners();
    });
  }

  @override
  void dispose() 
  {
    _timer?.cancel();
    _accelerometerSubscription?.cancel();
    _sfxPlayer.dispose(); // OBLIGATORIO: Liberar Ram
    super.dispose();
  }

  void _playSound(String fileName) async
  {
    await _sfxPlayer.release();
    await _sfxPlayer.play(AssetSource('audio/$fileName'));
  }

  void _initAccelerometer()
  {
    _accelerometerSubscription = accelerometerEventStream().listen((AccelerometerEvent event)
    {
      _logger.i(event.x.abs());

      if (_isGameOver && event.x.abs() > 15.0)
      {
        _resetGame();
      }
    });
  }

  void _resetGame()
  {
    _isGameOver = false;
    secondsElapsed = 0;
    _isFirstTap = true;
    _timer?.cancel();
    _generateBoard();
    notifyListeners();
  }
}