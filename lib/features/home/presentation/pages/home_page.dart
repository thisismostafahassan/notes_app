import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/features/home/presentation/widgets/note_widget.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = '/HomePage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppRouter.homeBloc,
      child: Scaffold(
        appBar: customAppBar(
          title: 'Notes',
          textStyle: TextStyle(fontSize: 50.sp),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final homeBloc = context.read<HomeBloc>();
            return ListView.builder(
              itemCount: homeBloc.notes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return NoteWidget(note: homeBloc.notes[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
