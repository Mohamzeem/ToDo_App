import 'package:get_it/get_it.dart';
import 'package:todo_app/blocs/switch_bloc/switch_bloc.dart';
import 'blocs/task_bloc/task_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TaskBloc());
  sl.registerFactory(() => SwitchBloc());
}
