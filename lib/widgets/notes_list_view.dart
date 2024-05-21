import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/models/note_model.dart';

import '../cubits/main_cubit/main_cubit.dart';
import 'note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainCubit>(context).fetchNotes();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder <MainCubit, MainState>(
      builder: (context, state) {
        List<NoteModel> notes=[];
        if(state is MainSuccess) {
          notes=state.notes;
        }
        debugPrint('notes=${notes.length}');
        return ModalProgressHUD(
          inAsyncCall: state is MainLoading ? true : false,
          opacity: 0,
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: NoteItem(notes[index]),
            );
          }),
        );
      },
    );
  }
}
