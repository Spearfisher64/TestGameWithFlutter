import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';

class Player extends SpriteComponent
    with CollisionCallbacks, HasGameRef, DragCallbacks {
  Player() : super(size: Vector2(64, 64), position: Vector2(100, 300));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.jpg');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Yerinde sabit kalıyor; objeler ona doğru geliyor.
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.localDelta.x;
    position.x = position.x.clamp(0.0, gameRef.size.x - size.x);
  }
}
