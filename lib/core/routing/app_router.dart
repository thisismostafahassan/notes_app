import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:notes_app/features/home/presentation/pages/note_details_page.dart';
import 'package:notes_app/main.dart';

import '../../features/home/presentation/pages/home_page.dart';

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

      // Home Page
      case HomePage.id:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(value: homeBloc, child: HomePage());
          },
        );

      // Note Details Page
      case NoteDetailsPage.id:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: homeBloc,
              child: NoteDetailsPage(),
            );
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
