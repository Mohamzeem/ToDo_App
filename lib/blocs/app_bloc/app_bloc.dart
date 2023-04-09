import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_state.dart';
part 'app_event.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc() : super(const AppInitial(false, false)) {
    on<LightThemeEvent>((event, emit) {
      emit(AppState(true, state.langValue));
    });
    on<DarkThemeEvent>((event, emit) {
      emit(AppState(false, state.langValue));
    });
    on<EnglishEvent>((event, emit) {
      emit(AppState(state.themeValue, true));
    });
    on<ArabicEvent>((event, emit) {
      emit(AppState(state.themeValue, false));
    });
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toMap();
  }
}
