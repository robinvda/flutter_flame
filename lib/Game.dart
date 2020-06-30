import 'dart:math';
import 'dart:ui';

import 'package:flame/components/text_component.dart';
import 'package:flame/game/game.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutterflame/CustomRect.dart';

class Game extends BaseGame {
  Size screenSize;

  CustomRect background;
  CustomRect rect;
  TextComponent scoreDisplay;

  Random random = Random();

  int score = 0;

  Game() {
    addBackground();

    addRect();

    addScoreDisplay();
  }

  void render(Canvas canvas) {
    scoreDisplay.text = score.toString();

    super.render(canvas);
  }

  void update(double t) {

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
      onTap: (rect, TapDownDetails details) {
        score--;
      }
    );

    add(background);
  }

  addRect() {
    rect = CustomRect(
      x: 50,
      y: 50,
      onTap: (rect, details) {
        rect.x = random.nextInt((screenSize.width - rect.width).floor()).toDouble();
        rect.y = random.nextInt((screenSize.height - rect.height).floor()).toDouble();

        rect.width--;
        rect.height--;

        this.score += 2;

        if (rect.width <= 50) {
          rect.width = 0;
          rect.height = 0;
        }
      }
    );

    add(rect);
  }

  addScoreDisplay() {
    scoreDisplay = TextComponent(
      score.toString(),
      config: TextConfig(
        color: Color(0xFFFFFFFF)
      )
    );

    scoreDisplay.x = 10;
    scoreDisplay.y = 10;

    add(scoreDisplay);
  }
}