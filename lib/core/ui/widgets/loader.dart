import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class Loader {
  static OverlayEntry? _entry;
  static bool _open = false;

  Loader._();

  static void show() {
    // isso forca a criacao caso nao exista
    _entry ??= OverlayEntry(builder: (context) {
      return Container(
        color: Colors.black54,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });

    if (!_open) {
      _open = true;
      asuka.addOverlay(_entry!); // esse ! serve para forcar o uso, dizer que tenho certeza que nao sera nulo
    }
  }

  static void hide() {
    if (_open) {
      _open = false;
      _entry?.remove();
    }
  }
}
