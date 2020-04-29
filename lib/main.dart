import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflame/Game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Game game = Game();

    return MaterialApp(
      home: Container(
        color: const Color(0xFF333333),
        child: Stack(
          children: <Widget>[
            game.widget,


          ],
        ),
      ),
    );
  }
}
