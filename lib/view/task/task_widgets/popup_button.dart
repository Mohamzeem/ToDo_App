// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/services/localizations.dart';
import 'package:todo_app/widgets/sized_box_widget.dart';

class PopupButton extends StatelessWidget {
  final TaskModel taskModel;
  final VoidCallback delete;
  final VoidCallback favorite;
  final Function() edit;
  final VoidCallback retore;
  const PopupButton({
    Key? key,
    required this.taskModel,
    required this.delete,
    required this.favorite,
    required this.edit,
    required this.retore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: const EdgeInsets.all(10),
        itemBuilder: taskModel.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: edit,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.edit_outlined),
                          const CustomSizedBox(height: 0, width: 0.01),
                          Text('edit_task'.tr(context),
                              style: Theme.of(context).textTheme.displaySmall),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.all(5),
                    onTap: delete,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.delete_outline),
                        const CustomSizedBox(height: 0, width: 0.01),
                        Text('delete_task'.tr(context),
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.all(5),
                    onTap: favorite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        taskModel.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove_outlined),
                        const CustomSizedBox(height: 0, width: 0.01),
                        Text(
                            taskModel.isFavorite == false
                                ? 'add_to_favorites'.tr(context)
                                : 'remove_from_favorites'.tr(context),
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    ),
                  ),
                ]
            : (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.all(5),
                    onTap: retore,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.restore_outlined),
                        const CustomSizedBox(height: 0, width: 0.01),
                        Text('restore'.tr(context),
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.all(5),
                    onTap: delete,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.delete_forever_outlined),
                        const CustomSizedBox(height: 0, width: 0.01),
                        Text('delete_forever'.tr(context),
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    ),
                  ),
                ]);
  }
}
