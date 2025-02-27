import 'package:notes_app/features/home/domain/repositories/base_home_repository.dart';

import '../entities/note.dart';

class AddNoteUsecase {
  final BaseHomeRepository baseHomeRepository;
  AddNoteUsecase({required this.baseHomeRepository});

  Note execute() {
    return baseHomeRepository.addNote();
  }
}
