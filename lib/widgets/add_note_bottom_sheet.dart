import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_colors.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/colors_listview.dart';
import 'package:notes_app/widgets/custom_button.dart';

import '../cubits/main_cubit/main_cubit.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  String? title, subTitle;

  final GlobalKey<FormState> globalKey = GlobalKey();
  var autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: AddNoteBottomSheetContent(),
    );
  }
}

class AddNoteBottomSheetContent extends StatefulWidget {
  const AddNoteBottomSheetContent({super.key});

  @override
  State<AddNoteBottomSheetContent> createState() =>
      _AddNoteBottomSheetContentState();
}

class _AddNoteBottomSheetContentState extends State<AddNoteBottomSheetContent> {
  String? title, subTitle;

  final GlobalKey<FormState> globalKey = GlobalKey();
  var autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Form(
          key: globalKey,
          autovalidateMode: autoValidateMode,
          child: Column(children: [
            const SizedBox(height: 32),
            CustomTextField(
              hint: 'title',
              onSave: (value) {
                if (value != null) title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'content',
              maxLines: 3,
              onSave: (value) {
                if (value != null) subTitle = value;
              },
            ),
            const SizedBox(height: 32),
            const ColorsListview(),
            const SizedBox(height: 32),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                handleState(state);
                return CustomButton(
                  isLoading: state is AddNoteLoadingState ? true : false,
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      final note = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateTime.now().toString(),
                        color: colors[BlocProvider.of<AddNoteCubit>(context).selectedColorIndex].value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    }
                    autoValidateMode = AutovalidateMode.always;
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }

  void handleState(AddNoteState state) {
    if (state is AddNoteSuccessState) {
      debugPrint('note added successfully');
      Navigator.pop(context);
      BlocProvider.of<MainCubit>(context).fetchNotes();
    }

    if (state is AddNoteFailureState) {
      debugPrint('errorMessage=${state.errorMessage}');
    }

    debugPrint('$state');
  }
}
