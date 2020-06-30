import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter/material.dart';
import 'package:flutterflame/Game.dart';

class CustomRect extends PositionComponent with HasGameRef<Game> {
  Paint color;

  double speed = 0.0;

  bool move = true;

  bool expanding = true;

  double baseX;
  double baseY;

  CustomRect({double x: 0, double y: 0, double width = 100, double height = 100, Color color, bool move = true}) {
    this.width = width;
    this.height = height;

    this.color = Paint()..color = color ?? Color(0xFFFFFFFF);

    this.x = x;
    this.y = y;

    this.baseX = x;
    this.baseY = y;

    this.move = move;
  }

  resetPosition() {
    x = baseX;
    y = baseY;
  }

  @override
  void update(double t) {
    if (this.move) {
      this.x *= (t + 1);
      this.y *= (t + 1);
    }
  }

  @override
  void render(Canvas canvas) {
    prepareCanvas(canvas);

    canvas.drawRect(toRect(), color);
  }
}