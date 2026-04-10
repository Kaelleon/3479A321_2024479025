import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/minesweeper_screen.dart';
import 'package:logger/logger.dart';
var logger = Logger();

void main() 
{
  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  logger.e('Iniciando la aplicación de Buscaminas'); // Error
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
