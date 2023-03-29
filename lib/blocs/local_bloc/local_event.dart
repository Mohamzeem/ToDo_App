part of 'local_bloc.dart';

abstract class LocalEvent extends Equatable {
  const LocalEvent();

  @override
  List<Object> get props => [];
}

class LocalOnEvent extends LocalEvent {}

class LocalOffEvent extends LocalEvent {}
