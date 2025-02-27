import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/helper/app_bloc_observer.dart';

void main() {
  // #1
  WidgetsFlutterBinding.ensureInitialized();
  // #2
  Bloc.observer = AppBlocObserver();
  // #3
  runZonedGuarded(
    () {
      runApp(
        ScreenUtilInit(
          designSize: Size(1080, 1920),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MultiBlocProvider(
            providers: [],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
