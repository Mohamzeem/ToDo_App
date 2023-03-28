// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class PopupButton extends StatelessWidget {
  final TaskModel taskModel;
  final VoidCallback delete;
  final VoidCallback favorite;
  final VoidCallback edit;
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
        padding: const EdgeInsets.all(0),
        itemBuilder: taskModel.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.all(0),
                    child: TextButton.icon(
                      onPressed: edit,
                      icon: const Icon(Icons.edit_outlined),
                      label: Text('Edit Task',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.all(0),
                    onTap: delete,
                    child: TextButton.icon(
                      onPressed: delete,
                      icon: const Icon(Icons.delete_outline),
                      label: Text('Delete Task',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.all(0),
                    onTap: favorite,
                    child: TextButton.icon(
                      onPressed: favorite,
                      icon: taskModel.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove_outlined),
                      label: Text(
                          taskModel.isFavorite == false
                              ? 'Add to Favorites'
                              : 'Remove from Favorites',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                ]
            : (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.all(0),
                    onTap: retore,
                    child: TextButton.icon(
                      onPressed: retore,
                      icon: const Icon(Icons.restore_outlined),
                      label: Text('Restore',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.all(0),
                    onTap: delete,
                    child: TextButton.icon(
                      onPressed: delete,
                      icon: const Icon(Icons.delete_forever_outlined),
                      label: Text('Delete Forever',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                ]);
  }
}
