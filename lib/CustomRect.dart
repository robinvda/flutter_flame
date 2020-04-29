import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter/material.dart';

class CustomRect extends PositionComponent with Tapable {
  Paint color;

  double speed = 0.0;

  Function(CustomRect, TapDownDetails) onTap;

  CustomRect({double x: 0, double y: 0, double width = 100, double height = 100, Color color, Function(CustomRect, TapDownDetails) onTap}) {
    this.width = width;
    this.height = height;

    this.color = Paint()..color = color ?? Color(0xFFFFFFFF);

    this.x = x;
    this.y = y;

    this.onTap = onTap;
  }

  @override
  void onTapDown(TapDownDetails details) {
    onTap(this, details);
  }

  @override
  void update(double time) {
    y += 200 * time * speed;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(toRect(), color);
  }
}