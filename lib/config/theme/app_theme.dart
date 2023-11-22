import 'package:flutter/material.dart';

class AppTheme {
  
  static const colorList = <Color>[
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.deepPurple,
    Colors.orange,
    Colors.pink,
    Colors.pinkAccent,
  ];
 
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert(selectedColor >= 0 && selectedColor <= colorList.length - 1,
            'El color debe estar entre 0 y ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor]
  );


}
