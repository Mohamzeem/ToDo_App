import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'blocs/app_bloc/app_bloc.dart';
import 'blocs/app_bloc/app_state.dart';
import 'blocs/task_bloc/task_bloc.dart';
import 'services/app_routes.dart';
import 'services/app_theme.dart';
import 'services/localizations.dart';
import 'view/task/screens/tabs_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => AppBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72727272727275, 781.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp(
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate
              ],
              localeResolutionCallback: (locales, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (locales != null &&
                      locales.languageCode == locale.languageCode) {
                    return locales;
                  }
                }
                return supportedLocales.first;
              },
              locale: state.langValue ? const Locale('ar') : const Locale('en'),
              debugShowCheckedModeBanner: false,
              title: 'Save My Tasks',
              onGenerateRoute: AppRoutes().onGenerateRoute,
              theme: state.themeValue
                  ? AppThemes().darkTheme()
                  : AppThemes().lightTheme(),
              home: const TabsPage(),
            );
          },
        ),
      ),
    );
  }
}
