// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_app/models/task_model.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<RemoveTaskEvent>(_onRemoveTask);
    on<FavoriteTaskEvent>(_onFavoriteTask);
    on<EditTaskEvent>(_onEditTask);
    on<RestoreTaskEvent>(_onRestoreTask);
    on<DeleteAllTaskEvent>(_onDeleteAllTask);
  }
  void _onAddTask(AddTaskEvent event, Emitter<TaskState> emitter) {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.taskModel),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onUpdateTask(UpdateTaskEvent event, Emitter<TaskState> emitter) {
    final state = this.state;
    final taskModel = event.taskModel;
    List<TaskModel> pendingTasks = state.pendingTasks;
    List<TaskModel> completedTasks = state.completedTasks;
    List<TaskModel> favoriteTasks = state.favoriteTasks;
    if (taskModel.isDone == false) {
      if (taskModel.isFavorite == false) {
        pendingTasks = List.from(pendingTasks)..remove(taskModel);
        completedTasks.insert(0, taskModel.copyWith(isDone: true));
      } else {
        var taskIndex = favoriteTasks.indexOf(taskModel);
        pendingTasks = List.from(pendingTasks)..remove(taskModel);
        completedTasks.insert(0, taskModel.copyWith(isDone: true));
        favoriteTasks = List.from(favoriteTasks)
          ..remove(taskModel)
          ..insert(taskIndex, taskModel.copyWith(isDone: true));
      }
    } else {
      if (taskModel.isFavorite == false) {
        completedTasks = List.from(completedTasks)..remove(taskModel);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, taskModel.copyWith(isDone: false));
      } else {
        var taskIndex = favoriteTasks.indexOf(taskModel);
        completedTasks = List.from(completedTasks)..remove(taskModel);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, taskModel.copyWith(isDone: false));
        favoriteTasks = List.from(favoriteTasks)
          ..remove(taskModel)
          ..insert(taskIndex, taskModel.copyWith(isDone: false));
      }
    }
    emit(TaskState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emitter) async {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.taskModel),
      ),
    );
  }

  void _onRemoveTask(RemoveTaskEvent event, Emitter<TaskState> emitter) async {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.taskModel),
        completedTasks: List.from(state.completedTasks)
          ..remove(event.taskModel),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.taskModel),
        removedTasks: List.from(state.removedTasks)
          ..add(event.taskModel.copyWith(isDeleted: true)),
      ),
    );
  }

  void _onFavoriteTask(FavoriteTaskEvent event, Emitter<TaskState> emitter) {
    final state = this.state;
    List<TaskModel> pendingTasks = state.pendingTasks;
    List<TaskModel> completedTasks = state.completedTasks;
    List<TaskModel> favoriteTasks = state.favoriteTasks;
    if (event.taskModel.isDone == false) {
      if (event.taskModel.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.taskModel);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.taskModel)
          ..insert(taskIndex, event.taskModel.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.taskModel.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.taskModel);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.taskModel)
          ..insert(taskIndex, event.taskModel.copyWith(isFavorite: false));
        favoriteTasks.remove(event.taskModel);
      }
    } else {
      if (event.taskModel.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(event.taskModel);
        completedTasks = List.from(completedTasks)
          ..remove(event.taskModel)
          ..insert(taskIndex, event.taskModel.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.taskModel.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTasks.indexOf(event.taskModel);
        completedTasks = List.from(completedTasks)
          ..remove(event.taskModel)
          ..insert(taskIndex, event.taskModel.copyWith(isFavorite: false));
        favoriteTasks.remove(event.taskModel);
      }
    }
    emit(TaskState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: favoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onEditTask(EditTaskEvent event, Emitter<TaskState> emitter) {
    final state = this.state;
    List<TaskModel> favoriteTasks = state.favoriteTasks;
    if (event.oldTask.isFavorite == true) {
      favoriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(
      TaskState(
          pendingTasks: List.from(state.pendingTasks)
            ..remove(event.oldTask)
            ..insert(0, event.newTask),
          completedTasks: state.completedTasks..remove(event.oldTask),
          favoriteTasks: favoriteTasks,
          removedTasks: state.removedTasks),
    );
  }

  void _onRestoreTask(RestoreTaskEvent event, Emitter<TaskState> emitter) {
    final state = this.state;
    emit(
      TaskState(
        removedTasks: List.from(state.removedTasks)..remove(event.taskModel),
        pendingTasks: List.from(state.pendingTasks)
          ..insert(
              0,
              event.taskModel.copyWith(
                  isDeleted: false, isDone: false, isFavorite: false)),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

  void _onDeleteAllTask(DeleteAllTaskEvent event, Emitter<TaskState> emitter) {
    final state = this.state;
    emit(
      TaskState(
        removedTasks: List.from(state.removedTasks)..clear(),
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
