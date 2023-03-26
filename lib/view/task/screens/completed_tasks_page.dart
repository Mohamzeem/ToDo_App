import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/task_model.dart';
import '../../../../blocs/task_bloc/task_bloc.dart';
import '../task_widgets/task_list.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({super.key});
  static const id = 'completed_tasks_page';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.completedTasks;
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              children: [
                Chip(
                    label: Text(
                  'Tasks: ${tasksList.length}',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
                TaskList(tasksList: tasksList),
              ],
            ),
          ),
        );
      },
    );
  }
}
