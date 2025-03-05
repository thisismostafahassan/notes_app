import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/core/widgets/form_of_bottom_sheet.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';

class ContentOfBottomSheet extends StatelessWidget {
  const ContentOfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: Color(0xFF303030),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.h),
          topLeft: Radius.circular(50.h),
        ),
      ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ModalProgressHUD(
            color: Colors.red,
            inAsyncCall: state is AddNoteLoadingState ? true : false,
            child: FormOfBottomSheet(),
          );
        },
      ),
    );
  }
}
