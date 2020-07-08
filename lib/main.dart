import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflame/engine/game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  final Game game = Game();

  game.world.loadArea(0, 0);

  runApp(Main(game));
}

class Main extends StatelessWidget {
  final Game game;

  Main(this.game);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF333333),
        appBar: AppBar(
          title: Text('Hi'),
        ),
        body: Stack(
          children: <Widget>[
            game.widget,
          ],
        ),
      ),
    );
  }
}
