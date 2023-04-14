import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/bloc/numbers_activity_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/bloc/numbers_activity_bloc_states.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/numbers_activity_engine_container.dart';

class NumbersActivityEngine extends FlameGame with HasDraggableComponents {
  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("activities/numbers/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      FlameBlocProvider<NumbersActivityBloc, NumbersActivityState>(
        create: () => NumbersActivityBloc(),
        children: [
          NumbersActivityEngineContainer()
            ..size = Vector2(
              size.x,
              size.y,
            ),
        ],
      ),
    );
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
