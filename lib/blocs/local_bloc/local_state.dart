part of 'local_bloc.dart';

class LocalState extends Equatable {
  final bool localValue;
  const LocalState({
    required this.localValue,
  });

  @override
  List<Object> get props => [localValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localValue': localValue,
    };
  }

  factory LocalState.fromMap(Map<String, dynamic> map) {
    return LocalState(
      localValue: map['localValue'] as bool,
    );
  }
}

class LocalInitial extends LocalState {
  const LocalInitial({required super.localValue});
}
