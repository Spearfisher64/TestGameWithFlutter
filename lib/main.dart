import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'my_game.dart';

void main() {
  final MyGame game = MyGame();

  runApp(
    GameWidget(
      game: game,
      overlayBuilderMap: {
        'GameOver': (ctx, game) {
          final myGame = game as MyGame; // game'i MyGame'e cast et

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Skor: ${myGame.score}', style: TextStyle(fontSize: 24)),
                ElevatedButton(
                  onPressed: () {
                    myGame.resumeEngine(); // Resume engine
                    myGame.overlays.remove(
                      'GameOver',
                    ); // Remove 'GameOver' overlay
                    myGame.reset(); // Reset the game state
                  },
                  child: const Text('Yeniden Başla'),
                ),
              ],
            ),
          );
        },
      },
    ),
  );
}
