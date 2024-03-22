import 'package:flutter/material.dart';

const Color _customColor = Color.fromRGBO(255, 153, 0, 1);

const List<Color> _colorThemes = [
  _customColor,
  Color.fromARGB(255, 79, 78, 78),
  Colors.blue,
  Colors.yellow,
  Colors.teal,
  Colors.green,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
