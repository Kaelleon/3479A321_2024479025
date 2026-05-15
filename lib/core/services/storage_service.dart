import 'package:shared_preferences/shared_preferences.dart';

class StorageService 
{
  static late SharedPreferences _prefs;

  // Inicialización asíncrona (Se llama al abrir la app)
  static Future<void> init() async 
  {
    _prefs = await SharedPreferences.getInstance();
  }
  
  // Setters y Getters
  static Future<void> saveUsername(String name) async => await
  _prefs.setString('username', name);
  static String getUsername() => _prefs.getString('username') ?? 'Jugador1';
  static Future<void> saveDifficulty(String difficulty) async => await
  _prefs.setString('difficulty', difficulty);
  static String getDifficulty() => _prefs.getString('difficulty') ??
  'Fácil';
}