// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskModel> pendingTasks;
  final List<TaskModel> completedTasks;
  final List<TaskModel> favoriteTasks;
  final List<TaskModel> removedTasks;
  const TaskState({
    this.pendingTasks = const <TaskModel>[],
    this.completedTasks = const <TaskModel>[],
    this.favoriteTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completedTasks, favoriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks: List<TaskModel>.from(
          (map['pendingTasks'].map((x) => TaskModel.fromMap(x)))),
      completedTasks: List<TaskModel>.from(
          (map['completedTasks'].map((x) => TaskModel.fromMap(x)))),
      favoriteTasks: List<TaskModel>.from(
          (map['favoriteTasks'].map((x) => TaskModel.fromMap(x)))),
      removedTasks: List<TaskModel>.from(
          (map['removedTasks'].map((x) => TaskModel.fromMap(x)))),
    );
  }
}
