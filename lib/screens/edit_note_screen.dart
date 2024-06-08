import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/main_cubit/main_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_colors.dart';
import 'package:notes_app/widgets/colors_listview.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import '../widgets/color_item.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    NoteModel noteModel =
        ModalRoute.of(context)?.settings.arguments as NoteModel;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Note'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () async {
                  noteModel.title = title ?? noteModel.title;
                  noteModel.subTitle = subTitle ?? noteModel.subTitle;
                  await noteModel.save();
                  Navigator.pop(context);
                  BlocProvider.of<MainCubit>(context).fetchNotes();
                },
                icon: const Icon(Icons.check),
                splashRadius: 1,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                hint: 'title',
                onChanged: (String? value) {
                  title = value;
                },
                initialValue: noteModel.title,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                hint: 'content',
                maxLines: 5,
                onChanged: (String? value) {
                  subTitle = value;
                },
                initialValue: noteModel.subTitle,
              ),
              const SizedBox(height: 16,),
              EditNoteColorsListview(noteModel: noteModel)
            ],
          ),
        ));
  }
}

class EditNoteColorsListview extends StatefulWidget {
  const EditNoteColorsListview({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  State<EditNoteColorsListview> createState() => _EditNoteColorsListviewState();
}

class _EditNoteColorsListviewState extends State<EditNoteColorsListview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    final index=colors.indexOf(Color(widget.noteModel.color));
    scrollController.animateTo(72.0*index, duration: const Duration(seconds: 2), curve: Curves.easeInOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.builder(
        controller: scrollController,
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    widget.noteModel.color=colors[index].value;
                  });
                },
                child: ColorItem(
                  color: colors[index],
                  isSelected: colors.indexOf(Color(widget.noteModel.color)) == index,
                ),
              ),
            );
          }),
    );
  }
}

