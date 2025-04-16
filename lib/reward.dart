import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter_game_app/obstacle.dart';
import 'package:flutter_game_app/player.dart';

class Reward extends Obstacle {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('reward.png');
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Player) {
      gameRef.score += 1;
      removeFromParent();
    }
  }
}
