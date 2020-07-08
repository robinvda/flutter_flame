import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterflame/engine/game_rect.dart';
import 'package:flutterflame/game/world.dart';

class Game extends BaseGame {
  Size screenSize;

  GameRect background;

  World world;

  Game() {
    world = World(this);

    addBackground();
  }

  init(World world) {
    this.world = world;
  }

  void render(Canvas canvas) {
    super.render(canvas);
  }

  void update(double t) {
    super.update(t);
  }

  void resize(Size size) {
    super.resize(screenSize = size);

    background.width = screenSize.width;
    background.height = screenSize.height;
  }

  addBackground() {
    background = GameRect(
      color: Color(0xFF333333),
      width: screenSize?.width ?? 0,
      height: screenSize?.height ?? 0,
      move: false
    );

    add(background);
  }
}