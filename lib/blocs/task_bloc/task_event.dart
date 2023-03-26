part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const AddTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const UpdateTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const DeleteTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class RemoveTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const RemoveTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class FavoriteTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const FavoriteTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class EditTaskEvent extends TaskEvent {
  final TaskModel oldTask;
  final TaskModel newTask;
  const EditTaskEvent({
    required this.oldTask,
    required this.newTask,
  });
  @override
  List<Object> get props => [oldTask, newTask];
}

class RestoreTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const RestoreTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class DeleteAllTaskEvent extends TaskEvent {}
