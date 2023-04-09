// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/app_bloc/app_bloc.dart';
import 'package:todo_app/services/localizations.dart';
import 'package:todo_app/view/task/screens/tabs_page.dart';
import '../../blocs/app_bloc/app_state.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../bin_recycle/bin_recycle_page.dart';
import 'drawer_widets/drawer_list_tile _widget.dart';
import 'drawer_widets/drawer_list_tile_text.dart';

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
                return ListTileDrawerText(
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
                return ListTileDrawerText(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(BinRecyclePage.id),
                  iconData: Icons.delete_outline_outlined,
                  title: 'bin_recycle'.tr(context),
                  trailing: '${state.removedTasks.length}       ',
                );
              },
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return ListTileDrawerWidget(
                  iconData: Icons.wb_sunny_outlined,
                  title: 'change_theme'.tr(context),
                  value: state.themeValue,
                  onChanged: (newVal) {
                    newVal
                        ? context.read<AppBloc>().add(LightThemeEvent())
                        : context.read<AppBloc>().add(DarkThemeEvent());
                  },
                );
              },
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return ListTileDrawerWidget(
                  iconData: Icons.language_outlined,
                  title: 'change_language'.tr(context),
                  value: state.langValue,
                  onChanged: (newVal) {
                    newVal
                        ? context.read<AppBloc>().add(EnglishEvent())
                        : context.read<AppBloc>().add(ArabicEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
