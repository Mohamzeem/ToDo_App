import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/task_model.dart';
import '../../../../blocs/task_bloc/task_bloc.dart';
import '../task_widgets/chip_text.dart';
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
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Column(
              children: [
                ChipText(text: 'Tasks:${tasksList.length}'),
                TaskList(tasksList: tasksList),
              ],
            ),
          ),
        );
      },
    );
  }
}
