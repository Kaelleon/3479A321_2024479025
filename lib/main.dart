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
      theme: ThemeData
      (
        colorScheme: ColorScheme.fromSeed
        (
          seedColor: const Color.fromARGB(255, 0, 255, 251),
          primary: const Color.fromARGB(255, 0, 17, 255),
          secondary: const Color.fromARGB(255, 255, 0, 0)
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 249, 255, 221), // Fondo pordefecto de todas las pantallas
        textTheme: const TextTheme
        (
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
      home: const MinesweeperScreen(), // Apuntamos a nuestra nueva pantalla
    );
  }
}
