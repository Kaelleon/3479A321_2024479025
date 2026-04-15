import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget 
{
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: const Text('About'),
      ),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            const Text('bienvenido a la pantalla about'),
            ElevatedButton
            (
              onPressed: () => Navigator.pop(context), // navegacion de regreso
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}