import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/storage_service.dart';
import 'package:flutter_application_1/models/settings_view_model.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget 
{
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    final settings = context.watch<SettingsViewModel>();
    
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
            Text('¡Hola, ${settings.username}!'),
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
              onPressed: () async 
              {
                await Navigator.pushNamed(context, '/settings');
                if (context.mounted) 
                {
                  context.read<SettingsViewModel>().refreshSettings();
                }
              },
              child: const Text('Ajustes'),
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