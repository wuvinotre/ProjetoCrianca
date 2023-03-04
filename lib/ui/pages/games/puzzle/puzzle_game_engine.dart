import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:projeto_crianca/ui/pages/games/puzzle/puzzle_game_engine_container.dart';
import 'package:flame_audio/flame_audio.dart';

class PuzzleGameEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents {
  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("games/puzzle/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    addAll([
      PuzzleGameEngineContainer()..size = Vector2(size.x, size.y),
    ]);
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
