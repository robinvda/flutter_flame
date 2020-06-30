import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterflame/CustomRect.dart';
import 'package:flutterflame/game/world.dart';

class Game extends BaseGame {
  Size screenSize;

  CustomRect background;

  List<CustomRect> rectangles = List<CustomRect>();

  World world;

  Game() {
    addBackground();

    world = World()..init(100);

    world.areas.first.rows.forEach((row) {
      row.cells.forEach((cell) {
        rectangles.add(CustomRect(
            x: cell.position.x,
            y: cell.position.y,
            width: 1,
            height: 1,
            color: Color(0xFFEEEEEE)
        ));
      });
    });

    rectangles.forEach((rectangle) {
      add(rectangle);
    });
  }

  void render(Canvas canvas) {
    super.render(canvas);
  }

  void update(double t) {
    super.update(t);

    if (rectangles.last.x > 10000) {
      rectangles.forEach((rectangle) {
        rectangle.resetPosition();
      });
    }
  }

  void resize(Size size) {
    super.resize(screenSize = size);

    background.width = screenSize.width;
    background.height = screenSize.height;
  }

  addBackground() {
    background = CustomRect(
      color: Color(0xFF333333),
      width: screenSize?.width ?? 0,
      height: screenSize?.height ?? 0,
      move: false
    );

    add(background);
  }
}