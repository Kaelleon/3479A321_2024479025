# Buscaminas Flutter

Proyecto desarrollado en Flutter para el módulo de Programación para Dispositivos Móviles.

## Descripción

Aplicación basada en el clásico juego Buscaminas donde el usuario debe descubrir todas las casillas seguras evitando las bombas ocultas.

El proyecto implementa mecánicas básicas de juego, interacción visual, sonidos, acelerómetro e interoperabilidad del sistema mediante funciones nativas de compartir.

---

## Funcionalidades Implementadas

* Generación aleatoria de tablero.
* Sistema de bombas y detección de derrota.
* Temporizador de partida.
* Reproducción de efectos de sonido:
  * Selección de casilla.
  * Explosión.
* Reinicio del juego mediante acelerómetro.
* Cambio de identidad digital:
  * Package Name.
  * Launcher Icon.
* Compartir resultados mediante menú nativo del dispositivo.

---

## Tecnologías Utilizadas

* Flutter
* Dart
* Provider
* audioplayers
* sensors_plus
* share_plus
* logger

---

## Estructura del Proyecto

```text
lib/
├── core/
│ └── services/
│ └── storage_service.dart
│
├── models/
│ ├── cell_model.dart
│ ├── game_result.dart
│ ├── game_view_model.dart
│ └── settings_view_model.dart
│
├── ui/
│ ├── screens/
│ │ ├── about.dart
│ │ ├── history_screen.dart
│ │ ├── menu_screen.dart
│ │ ├── minesweeper_screen.dart
│ │ └── settings_screen.dart
│ │
│ └── widgets/
│ ├── GameResultUI.dart
│ └── mine_cell.dart
│
└── main.dart
```

---

## Cómo Ejecutar el Proyecto

1. Clonar repositorio.
2. Ejecutar:

```bash
flutter pub get
```

3. Ejecutar aplicación:

```bash
flutter run
```

---

## Trabajos Futuros

* Implementar condición de victoria.
* Agregar niveles de dificultad.
* Sistema de banderas.
* Guardado de puntajes.
* Mejorar animaciones y efectos visuales.
