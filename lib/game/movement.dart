import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void eventListener(PointerEvent details){
  RawKeyboardListener(
    autofocus: true,
    focusNode: FocusNode(),
    onKey: (event) {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        // CHANGE DIRECTION UP
      }
      if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          // CHANGE DIRECTION Right
      }
      if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          // CHANGE DIRECTION Left
      }
      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        // CHANGE DIRECTION Down
      }
    },
    child:
    const Listener(
      onPointerDown: null,
    ),
  );
}
