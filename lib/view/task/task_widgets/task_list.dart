// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/services/localizations.dart';
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
                      canTapOnHeader: true,
                      value: task.id,
                      headerBuilder: (context, isExpanded) =>
                          TaskTile(taskModel: task),
                      body: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: SelectableText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${'title'.tr(context)}:',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                TextSpan(
                                    text: '  ${task.title}',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                TextSpan(
                                  text: '\n${'content'.tr(context)}:',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                TextSpan(
                                    text: '  ${task.body}',
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
