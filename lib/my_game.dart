import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';
import 'player.dart';
import 'obstacle.dart';
import 'reward.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late Player player;
  late Timer gameTimer;
  late Timer spawnTimer;

  final double gameDuration = 10.0; // saniye
  int score = 0;

  @override
  Future<void> onLoad() async {
    player = Player();
    add(player);

    gameTimer = Timer(gameDuration, onTick: endGame);
    spawnTimer = Timer(
      1.0,
      repeat: true,
      onTick: () {
        final rand = Random();
        final isReward = rand.nextBool();
        final object = isReward ? Reward() : Obstacle();
        add(object);
      },
    );

    gameTimer.start();
    spawnTimer.start();
  }

  void endGame() {
    pauseEngine();
    overlays.add('GameOver');
  }

  @override
  void update(double dt) {
    super.update(dt);
    gameTimer.update(dt);
    spawnTimer.update(dt);
  }

  void reset() {
    children.clear();
    score = 0;

    player = Player();
    add(player);

    gameTimer.start();
    spawnTimer.start();
  }
}
