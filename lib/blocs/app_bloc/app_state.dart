// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool themeValue;
  final bool langValue;
  const AppState(
    this.themeValue,
    this.langValue,
  );

  @override
  List<Object> get props => [themeValue, langValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeValue': themeValue,
      'langValue': langValue,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      map['themeValue'] as bool,
      map['langValue'] as bool,
    );
  }
}

class AppInitial extends AppState {
  const AppInitial(super.themeValue, super.langValue);
}
