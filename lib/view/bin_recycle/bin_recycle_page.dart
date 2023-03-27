import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/task/task_widgets/chip_text.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../../widgets/sized_box_widget.dart';
import '../../widgets/snack_bar.dart';
import '../drawer/drawer_view.dart';
import '../task/task_widgets/task_list.dart';

class BinRecyclePage extends StatelessWidget {
  const BinRecyclePage({super.key});
  static const id = 'bin_recycle_page';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(context),
          drawer: const MyDrawer(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                children: [
                  ChipText(text: 'Tasks: ${state.removedTasks.length}'),
                  TaskList(tasksList: state.removedTasks),
                  const CustomSizedBox(height: 0.08, width: 1)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
          title: Text(
            'Bin Recycle',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              elevation: 5,
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<TaskBloc>().add(DeleteAllTaskEvent());
                    ShowSnackBar().showErrorSnackBar(
                        context: context,
                        message: 'All Tasks Deleted Permanently');
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: Text('Delete All Forever',
                      style: Theme.of(context).textTheme.displaySmall),
                ))
              ],
            )
          ]);
}
