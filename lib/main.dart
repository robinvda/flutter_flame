import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflame/Game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  runApp(FlutterFlame());
}

class FlutterFlame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Game game = Game();

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
