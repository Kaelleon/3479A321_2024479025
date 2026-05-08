import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/minesweeper_screen.dart';
import 'package:flutter_application_1/ui/screens/menu_screen.dart';
import 'package:flutter_application_1/ui/screens/history_screen.dart';
import 'package:flutter_application_1/ui/screens/about.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/game_view_model.dart';
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
      initialRoute: '/menu',
      // Mapa centralizado de Rutas Nombradas
      routes: 
      {
        '/menu': (context) => const MenuScreen(),
        '/game': (context) => ChangeNotifierProvider
        (
        create: (context) => GameViewModel(),
        child: MinesweeperScreen(),
        ),
        '/history': (context) => const HistoryScreen(),
        '/about': (context) => const AboutScreen(),
      },

      title: 'Buscamina',
      theme: ThemeData
      (
        colorScheme: ColorScheme.fromSeed
        (
          seedColor: const Color.fromARGB(255, 0, 255, 251),
          primary: const Color.fromARGB(255, 0, 17, 255),
          secondary: const Color.fromARGB(255, 122, 142, 255)
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 249, 255, 221), // Fondo pordefecto de todas las pantallas
        textTheme: const TextTheme
        (
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
    );
  }
}
