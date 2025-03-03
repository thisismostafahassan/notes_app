import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/constants/constants.dart';
import 'package:notes_app/core/helper/app_bloc_observer.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/themes/theme_data/theme_data.dart';
import 'package:notes_app/features/home/domain/entities/note.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:notes_app/features/home/presentation/pages/home_page.dart';

void main() async {
  runZonedGuarded(
    () async {
      //
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = AppBlocObserver();
      // # Hive
      await Hive.initFlutter();
      Hive.registerAdapter(NoteAdapter());
      await Hive.openBox<Note>(Constants.kNotesBox);

      AppRouter appRouter = AppRouter();
      runApp(
        ScreenUtilInit(
          designSize: Size(1080, 1920),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MultiBlocProvider(
            providers: [BlocProvider(create: (context) => HomeBloc())],
            child: MaterialApp(
              onGenerateRoute: appRouter.onGenerateRoute,
              debugShowCheckedModeBanner: false,
              theme: theLightTheme(),
              home: MyApp(),
            ),
          ),
        ),
      );
    },
    (error, stackTrace) {
      log('❌ Uncaught Error: $error');
    },
  );
  //
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
