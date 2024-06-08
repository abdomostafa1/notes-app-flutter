import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  int selectedColorIndex=0;
  addNote(NoteModel note) async{

    emit(AddNoteLoadingState());
    var box=Hive.box<NoteModel>(kNotesBox);
    try {
      await box.add(note);
      print('AddNoteSuccessState');
      emit(AddNoteSuccessState());
    }
    catch (e){
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
