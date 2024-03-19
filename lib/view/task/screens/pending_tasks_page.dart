import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/services/localizations.dart';
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
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ChipText(
                    //     text: '${'pending'.tr(context)}: ${tasksList.length}'),
                    ChipText(
                        text:
                            '${'completed'.tr(context)}: ${state.completedTasks.length}'),
                    ChipText(
                        text:
                            '${'favorites'.tr(context)}: ${state.favoriteTasks.length}'),
                    ChipText(
                        text:
                            '${'deleted'.tr(context)}: ${state.removedTasks.length}'),
                  ],
                ),
                SizedBox(height: 5.h),
                TaskList(tasksList: tasksList),
              ],
            ),
          ),
        );
      },
    );
  }
}
