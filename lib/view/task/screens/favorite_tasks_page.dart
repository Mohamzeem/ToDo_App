import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/task_model.dart';
import '../../../../blocs/task_bloc/task_bloc.dart';
import '../task_widgets/chip_text.dart';
import '../task_widgets/task_list.dart';

class FavoriteTasksPage extends StatelessWidget {
  const FavoriteTasksPage({super.key});
  static const id = 'favorite_tasks_page';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.favoriteTasks;
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Column(
              children: [
                ChipText(text: 'Tasks:${state.favoriteTasks.length}'),
                TaskList(tasksList: tasksList),
              ],
            ),
          ),
        );
      },
    );
  }
}
