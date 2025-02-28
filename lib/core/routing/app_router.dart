import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:notes_app/main.dart';

class AppRouter {
  static final homeBloc = HomeBloc();
  // Routes
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // initial route
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(value: homeBloc, child: MyApp());
          },
        );

      //
      default:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(value: homeBloc, child: MyApp());
          },
        );
    }
  }
}
