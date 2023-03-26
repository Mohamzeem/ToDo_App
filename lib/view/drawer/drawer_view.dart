// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/drawer/drawer_widets/drawer_list_tile.dart';
import 'package:todo_app/view/task/screens/tabs_page.dart';
import '../../blocs/switch_bloc/switch_bloc.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../bin_recycle/bin_recycle_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Center(
                child: Text(
                  'Tasks Navigator',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTileDrawer(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabsPage.id),
                  iconData: Icons.folder_copy_outlined,
                  title: 'My Tasks',
                  trailing:
                      '${state.pendingTasks.length} / ${state.completedTasks.length}',
                );
              },
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTileDrawer(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(BinRecyclePage.id),
                  iconData: Icons.delete_outline_outlined,
                  title: 'Bin Recycle',
                  trailing: '${state.removedTasks.length}',
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.sunny,
              ),
              title: Text(
                'Change Theme',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                    value: state.switchValue,
                    onChanged: (value) {
                      value
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
