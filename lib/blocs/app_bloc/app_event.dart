part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class LightThemeEvent extends AppEvent {}

class DarkThemeEvent extends AppEvent {}

class EnglishEvent extends AppEvent {}

class ArabicEvent extends AppEvent {}
