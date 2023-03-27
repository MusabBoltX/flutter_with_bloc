// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_with_bloc/src/color_bloc/color_event.dart';
import 'package:flutter_with_bloc/src/color_bloc/color_state.dart';
import 'package:flutter/material.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorStateInit()) {
    on<ColorIncrementEvent>((event, emit) {
      emit(ColorIncrementState(Colors.cyan));
    });

    on<ColorDecrementEvent>((event, emit) {
      emit(ColorDecrementState(Colors.teal));
    });
  }
}
