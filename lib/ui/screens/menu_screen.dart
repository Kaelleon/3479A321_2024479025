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
            const Icon(Icons.grid_on, size: 80, color: Colors.deepPurple),
            const SizedBox(height:  16),
            Text
            (
              '¡Hola, ${settings.username}!', 
              style: const TextStyle
              (
                fontSize: 28, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),

            Card
            (
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding
              (
                padding: const EdgeInsets.all(8.0),
                child: Column
                (
                  children: 
                  [
                    const Text('Configuracion Actual', style: TextStyle(color: Colors.grey)),
                    const Divider(),
                    ListTile
                    (
                      leading: const Icon(Icons.dashboard, color: Colors.deepPurple),
                      title: Text('Dificultad: ${settings.difficulty}'),
                      subtitle: Text('Tablero de ${settings.gridSize}x${settings.gridSize}'),
                      trailing: IconButton
                      (
                        icon: const Icon(Icons.edit),
                        onPressed: () => Navigator.pushNamed(context, '/settings'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            SizedBox
            (
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon
              (
                icon: const Icon(Icons.play_arrow, size: 28),
                label: const Text('NUEVA PARTIDA', style:TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom
                (
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/game'),
              ),
            ),
            const SizedBox(height: 16),

            TextButton.icon
            (
              icon: const Icon(Icons.history),
              label: const Text('Ver Historial de Partidas'),
              onPressed: () => Navigator.pushNamed(context, '/history'),
            ),
            
            TextButton.icon
            (
              icon: const Icon(Icons.info),
              label: const Text('Acerca de'),
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        )
      ),
    );
  }
}