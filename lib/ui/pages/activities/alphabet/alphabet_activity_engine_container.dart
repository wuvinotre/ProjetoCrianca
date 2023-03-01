import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_page.dart';
import 'package:projeto_crianca/ui/pages/activities/components/canvas_component.dart';
import 'package:projeto_crianca/ui/pages/activities/components/hint_container_component.dart';

class AlphabetActivityEngineContainer extends RectangleComponent
    with HasGameRef<AlphabetActivityEngine>, VibrationMixin {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    List<Vector2> queue = List<Vector2>.from(
      currentLetter.points.entries.elementAt(0).value,
    );

    int currentPart = 0;
    int parts = currentLetter.points.entries.length - 1;

    void onTrailPositionUpdate(Vector2 trailPosition) {
      Vector2? current = currentLetter.points.entries
          .elementAt(currentPart)
          .value
          .firstWhereOrNull(
            (element) =>
                trailPosition.x >= element.x - 12 &&
                trailPosition.x <= element.x - 12 + 24 &&
                trailPosition.y >= element.y - 12 &&
                trailPosition.y <= element.y - 12 + 24,
          );

      if (current != null) {
        final contain = queue.firstWhereOrNull(
              (element) => element == current,
            ) !=
            null;

        if (queue.isEmpty) {
          if (currentPart == parts) {
            currentPart = 0;

            nextLetterCallback();
          } else {
            if (currentPart < parts) {
              currentPart += 1;
              queue = List<Vector2>.from(
                currentLetter.points.entries.elementAt(currentPart).value,
              );
              vibrate(duration: 50);
            }
          }
        } else if (queue.first == current) {
          queue.removeAt(0);
          vibrate(duration: 10);
        } else if (contain) {
          queue = List<Vector2>.from(
            currentLetter.points.entries.elementAt(currentPart).value,
          );
          vibrate(duration: 20);
        }
      }
    }

    addAll([
      RectangleHitbox()
        ..paint = paint
        ..renderShape = true,
      HintContainerComponent(
        image: currentLetter.image,
        imageSize: Vector2(230, 230),
        onTrailPositionUpdate: onTrailPositionUpdate,
        data: currentLetter.points.entries.elementAt(currentPart).value.map(
              (e) => PositionComponent()
                ..size = Vector2(24, 24)
                ..position = e - Vector2(12, 12)
                ..debugMode = true,
            ),
      )
        ..position = Vector2(
          size.x / 2,
          size.y / 2,
        )
        ..size = Vector2(230, 230)
        ..anchor = Anchor.center,
    ]);
  }
}
