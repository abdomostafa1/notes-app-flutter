import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note){

    emit(AddNoteLoadingState());
    var box=Hive.box(kNotesBox);
    try {
      box.add(note);
      emit(AddNoteSuccessState());
    }
    catch (e){
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
