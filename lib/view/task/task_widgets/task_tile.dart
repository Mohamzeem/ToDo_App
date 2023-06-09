import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/services/localizations.dart';
import 'package:todo_app/view/task/task_widgets/edit_task.dart';
import 'package:todo_app/widgets/sized_box_widget.dart';
import 'package:todo_app/widgets/snack_bar.dart';
import '../../../blocs/task_bloc/task_bloc.dart';
import '../../../models/task_model.dart';
import 'popup_button.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const CustomSizedBox(height: 0, width: 0.02),
              Icon(
                taskModel.isFavorite == false
                    ? Icons.star_border_outlined
                    : Icons.star,
              ),
              const CustomSizedBox(height: 0, width: 0.02),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      DateFormat('E, d MMM yyyy   HH:mm:ss a')
                          .format(DateTime.parse(taskModel.date)),
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            taskModel.isDeleted == false
                ? Checkbox(
                    value: taskModel.isDone,
                    onChanged: taskModel.isDeleted == false
                        ? (value) {
                            context
                                .read<TaskBloc>()
                                .add(UpdateTaskEvent(taskModel: taskModel));
                            ShowSnackBar().showSuccessSnackBar(
                                context: context,
                                message: taskModel.isDone == false
                                    ? 'task_completed_moved_successfully'
                                        .tr(context)
                                    : 'task_pended_restored_successfully'
                                        .tr(context));
                          }
                        : null,
                  )
                : Container(),
            PopupButton(
              taskModel: taskModel,
              delete: () {
                removeOrDeleteTask(context, taskModel);
                ShowSnackBar().showErrorSnackBar(
                    context: context,
                    message: taskModel.isDeleted == false
                        ? 'task_removed_successfully'.tr(context)
                        : 'task_deleted_permanently'.tr(context));
              },
              favorite: () {
                context
                    .read<TaskBloc>()
                    .add(FavoriteTaskEvent(taskModel: taskModel));
                ShowSnackBar().showSuccessSnackBar(
                    context: context,
                    message: taskModel.isFavorite == false
                        ? 'task_added_to_favroites_successfully'.tr(context)
                        : 'task_removed_from_favorites'.tr(context));
              },
              edit: () {
                Navigator.pop(context);
                _editTask(context);
              },
              retore: () {
                context
                    .read<TaskBloc>()
                    .add(RestoreTaskEvent(taskModel: taskModel));
                ShowSnackBar().showSuccessSnackBar(
                    context: context,
                    message: 'task_restored_successfully'.tr(context));
              },
            )
          ],
        ),
      ],
    );
  }

  void removeOrDeleteTask(BuildContext context, TaskModel taskModel) {
    taskModel.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTaskEvent(taskModel: taskModel))
        : context.read<TaskBloc>().add(RemoveTaskEvent(taskModel: taskModel));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: EditTask(
                oldTask: taskModel,
              ),
            ),
          ),
        );
      },
    );
  }
}
