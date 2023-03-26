// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/view/task/task_widgets/task_tile.dart';
import '../../../models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            children: tasksList
                .map((task) => ExpansionPanelRadio(
                      value: task.id,
                      headerBuilder: (context, isExpanded) =>
                          TaskTile(taskModel: task),
                      body: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: SelectableText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Title:',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                TextSpan(
                                    text: ' ${task.title}',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                TextSpan(
                                  text: '\nDescription:',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                TextSpan(
                                    text: ' ${task.body}',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}


// Expanded(
//         child: ListView.builder(
//       itemCount: tasksList.length,
//       itemBuilder: (context, index) {
//         final task = tasksList[index];

//         return ListTileWidget(taskModel: task);
//       },
//     ))