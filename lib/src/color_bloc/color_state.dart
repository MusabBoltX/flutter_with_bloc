import 'package:flutter/material.dart';

abstract class ColorState {
  Color color = Colors.amber;

  ColorState({required this.color});
}

class ColorStateInit extends ColorState {
  ColorStateInit() : super(color: Colors.amber);
}

class ColorIncrementState extends ColorState {
  ColorIncrementState(Color color) : super(color: color);
}

class ColorDecrementState extends ColorState {
  ColorDecrementState(Color color) : super(color: color);
}
