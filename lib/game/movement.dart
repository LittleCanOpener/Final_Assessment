import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _EventListener extends StatelessWidget {
  const _EventListener({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

void movement(RawKeyboardListener value) {
  RawKeyboardListener(
    autofocus: true,
    focusNode: FocusNode(),
    onKey: (event) {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        // CHANGE DIRECTION UP
        print('Arrow Key Up');
      }
      else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          // CHANGE DIRECTION Right
        print('Arrow Key Right');
      }
      else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          // CHANGE DIRECTION Left
        print('Arrow Key Left');
      }
      else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        // CHANGE DIRECTION Down
        print('Arrow Key Down');
      }
    },
    child:
    const Listener(
      onPointerDown: null,
    ),
  );
}
