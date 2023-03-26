import 'package:get_it/get_it.dart';
import 'blocs/task_bloc/task_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TaskBloc());
}
