import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const EventListener());

class EventListener extends StatelessWidget {
  const EventListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Arrow Key Events'),
        ),
        body: const ArrowKeyHandler(),
      ),
    );
  }
}

class ArrowKeyHandler extends StatelessWidget {
  const ArrowKeyHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
          // CHANGE DIRECTION UP
          print('Arrow Key Up');
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          // CHANGE DIRECTION Right
          print('Arrow Key Right');
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          // CHANGE DIRECTION Left
          print('Arrow Key Left');
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
          // CHANGE DIRECTION Down
          print('Arrow Key Down');
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text('Press Arrow Keys'),
      ),
    );
  }
}