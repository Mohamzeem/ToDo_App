// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/local_bloc/local_bloc.dart';
import 'package:todo_app/services/localizations.dart';
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
                  'tasks_navigator'.tr(context),
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
                  title: 'my_tasks'.tr(context),
                  trailing:
                      '${state.pendingTasks.length} / ${state.completedTasks.length}    ',
                );
              },
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTileDrawer(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(BinRecyclePage.id),
                  iconData: Icons.delete_outline_outlined,
                  title: 'bin_recycle'.tr(context),
                  trailing: '${state.removedTasks.length}       ',
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.sunny,
              ),
              title: Text(
                'change_theme'.tr(context),
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
            // ListTile(
            //   leading: const Icon(
            //     Icons.language_outlined,
            //   ),
            //   title: Text(
            //     'change_language'.tr(context),
            //     style: Theme.of(context).textTheme.titleMedium,
            //   ),
            //   trailing: BlocBuilder<LocalBloc, LocalState>(
            //     builder: (context, state) {
            //       return Switch(
            //         value: state.localValue,
            //         onChanged: (value) {
            //           value
            //               ? context.read<LocalBloc>().add(LocalOnEvent())
            //               : context.read<LocalBloc>().add(LocalOffEvent());
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
