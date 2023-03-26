import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/task_model.dart';
import '../../../blocs/task_bloc/task_bloc.dart';
import '../task_widgets/chip_text.dart';
import '../task_widgets/task_list.dart';

class PendingTasksPage extends StatelessWidget {
  const PendingTasksPage({super.key});
  static const id = 'pending_tasks_page';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.pendingTasks;
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChipText(text: 'Pending: ${tasksList.length}'),
                    ChipText(text: 'Completed:${state.completedTasks.length}'),
                    ChipText(text: 'Favorites:${state.favoriteTasks.length}'),
                    ChipText(text: 'Deleted:${state.removedTasks.length}'),
                  ],
                ),
                TaskList(tasksList: tasksList),
              ],
            ),
          ),
        );
      },
    );
  }
}
