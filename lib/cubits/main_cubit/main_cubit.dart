import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../models/note_model.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());


  fetchNotes() {
    emit(MainLoading());
    var box = Hive.box<NoteModel>(kNotesBox);
    try {
      var notes = box.values.toList() as List<NoteModel>;
      emit(MainSuccess(notes));
    } catch (e) {
      emit(MainFailure(e.toString()));
    }
  }
}
