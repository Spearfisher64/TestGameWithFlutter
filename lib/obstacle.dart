import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter_game_app/player.dart';
import 'my_game.dart';

class Obstacle extends SpriteComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  Obstacle() : super(size: Vector2(40, 40), position: Vector2(800, 300));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('obstacle.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 150 * dt;
    if (position.x < -size.x) removeFromParent();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Player) {
      gameRef.score -= 1;
      removeFromParent();
    }
  }
}
