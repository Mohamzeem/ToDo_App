import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../blocs/task_bloc/task_bloc.dart';
import '../../../models/task_model.dart';
import '../../../widgets/elevated_button_icon.dart';
import '../../../widgets/sized_box_widget.dart';
import '../../../widgets/snack_bar.dart';

class EditTask extends StatelessWidget {
  final TaskModel oldTask;

  const EditTask({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    final TextEditingController bodyController =
        TextEditingController(text: oldTask.body);

    return Column(
      children: [
        Text('Edit Task', style: Theme.of(context).textTheme.bodyLarge),
        const CustomSizedBox(height: 0.015, width: 1),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.r),
              label:
                  Text('Title', style: Theme.of(context).textTheme.bodyMedium),
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 1))),
        ),
        const CustomSizedBox(height: 0.015, width: 1),
        TextField(
          autofocus: true,
          minLines: 3,
          maxLines: 5,
          controller: bodyController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.r),
              label: Text('Description',
                  style: Theme.of(context).textTheme.bodyMedium),
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 1))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElvatedBtnWithIcon(
              width: 0.25,
              height: 0.04,
              labelText: 'Save',
              onPressed: () {
                var editedTask = TaskModel(
                    title: titleController.text,
                    body: bodyController.text,
                    id: oldTask.id,
                    isFavorite: oldTask.isFavorite,
                    isDeleted: false,
                    date: DateTime.now().toString());
                context
                    .read<TaskBloc>()
                    .add(EditTaskEvent(oldTask: oldTask, newTask: editedTask));
                titleController.clear();
                bodyController.clear();
                Navigator.pop(context);
                ShowSnackBar().showSuccessSnackBar(
                    context: context, message: 'Task Edited Successfully');
              },
              iconData: Icons.save_alt_outlined,
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
            ),
            CustomElvatedBtnWithIcon(
              width: 0.25,
              height: 0.04,
              labelText: 'Cancel',
              onPressed: () {
                titleController.clear();
                bodyController.clear();
                Navigator.pop(context);
              },
              iconData: Icons.cancel_outlined,
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}
