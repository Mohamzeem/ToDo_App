import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/services/id_generator.dart';
import 'package:todo_app/services/localizations.dart';
import '../../../blocs/task_bloc/task_bloc.dart';
import '../../../models/task_model.dart';
import '../../../widgets/elevated_button_icon.dart';
import '../../../widgets/sized_box_widget.dart';
import '../../../widgets/snack_bar.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Column(
      children: [
        Text('add_task'.tr(context),
            style: Theme.of(context).textTheme.bodyLarge),
        const CustomSizedBox(height: 0.015, width: 1),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.r),
              label: Text('title'.tr(context),
                  style: Theme.of(context).textTheme.bodyMedium),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.redAccent))),
        ),
        const CustomSizedBox(height: 0.015, width: 1),
        TextField(
          autofocus: true,
          minLines: 3,
          maxLines: 5,
          controller: bodyController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.r),
              label: Text('content'.tr(context),
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
              labelText: 'add'.tr(context),
              onPressed: () {
                var task = TaskModel(
                    title: titleController.text,
                    body: bodyController.text,
                    id: Uuid().generateV4(),
                    date: DateTime.now().toString());
                context.read<TaskBloc>().add(AddTaskEvent(taskModel: task));
                titleController.clear();
                bodyController.clear();
                Navigator.pop(context);
                ShowSnackBar().showSuccessSnackBar(
                    context: context,
                    message: 'task_added_succesfully'.tr(context));
              },
              iconData: Icons.save_alt_outlined,
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
            ),
            CustomElvatedBtnWithIcon(
              width: 0.25,
              height: 0.04,
              labelText: 'cancel'.tr(context),
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
