import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple
  ];

  String getPath(int num) => 'note${num + 1}.wav';

  void playSound(String path) {
    final player = AudioCache();
    player.play(path);
  }

  Widget makeButton(int num) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        color: colors[num],
        onPressed: () {
          playSound(getPath(num));
        },
      ),
    );
  }

  final buttons = <Widget>[];

  @override
  Widget build(BuildContext context) {
    buttons.clear();
    for (var i = 0; i < 7; i++) {
      buttons.add(makeButton(i));
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
