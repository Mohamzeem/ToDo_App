import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'local_event.dart';
part 'local_state.dart';

class LocalBloc extends HydratedBloc<LocalEvent, LocalState> {
  LocalBloc() : super(const LocalInitial(localValue: false)) {
    on<LocalOnEvent>((event, emit) {
      emit(const LocalState(localValue: true));
    });
    on<LocalOffEvent>((event, emit) {
      emit(const LocalState(localValue: false));
    });
  }

  @override
  LocalState? fromJson(Map<String, dynamic> json) {
    return LocalState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LocalState state) {
    return state.toMap();
  }
}
