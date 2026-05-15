import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/storage_service.dart';

class MenuScreen extends StatelessWidget 
{
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    var username = StorageService.getUsername();
    
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
            Text('Pantalla de Menú, Bienvenido! $username'),
            SizedBox(height: 20),
            const Text('Buscamina'),
            ElevatedButton
            (
              onPressed: () => Navigator.pushNamed(context, '/game', 
              arguments: {'difficulty': 'Facil', 'gridSize': 8},),
              child: const Text('Jugar'),
            ),
            ElevatedButton
            (
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Historial'),
            ),
            ElevatedButton
            (
              onPressed: () => Navigator.pushNamed(context, '/settings'), 
              child: const Text('ajustes'),
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