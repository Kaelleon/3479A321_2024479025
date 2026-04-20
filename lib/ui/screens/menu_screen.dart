import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget 
{
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Menu (Maqueta)')),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            const Text('Buscamina'),
            ElevatedButton
            (
              onPressed: () => Navigator.pushNamed(context, '/game', arguments: {'difficulty': 'Facil', 'gridSize': 8},),
              child: const Text('Jugar'),
            ),
            ElevatedButton
            (
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Historial'),
            ),
            ElevatedButton
            (
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('Acera de'),
            ),
          ],
        )
      ),
    );
  }
}