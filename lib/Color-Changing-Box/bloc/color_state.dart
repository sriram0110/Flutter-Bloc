part of 'color_bloc.dart';

abstract class ColorState {}

class ColorInitialState extends ColorState {
  
}

class ColorUpdateState extends ColorState {
  bool? initialState;
  
  ColorUpdateState({
    this.initialState,
  });
}

class TextUpdateState extends ColorState{
  String? textChange;
  TextUpdateState({required this.textChange});

}