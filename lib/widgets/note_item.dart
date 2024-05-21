import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/main_cubit/main_cubit.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(this.note, {super.key});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.editNoteScreen),
      child: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    note.subTitle,
                    style: const TextStyle(
                      color: Color(0xff9C733D),
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () async {
                      await note.delete();
                      BlocProvider.of<MainCubit>(context).fetchNotes();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 32,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  note.date.substring(0, 10),
                  style: const TextStyle(color: Color(0xff9C733D)),
                ),
              )
            ],
          )),
    );
  }
}
