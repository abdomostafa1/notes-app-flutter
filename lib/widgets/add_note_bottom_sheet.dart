import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';

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
    BlocListener<AddNoteCubit, AddNoteState>(listener: (context, state) {
      if (state is AddNoteSuccessState) {
        Navigator.pop(context);
      }

      if (state is AddNoteFailureState) {
        debugPrint('errorMessage=${state.errorMessage}');
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoadingState ? true : false,
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      final note = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateTime.now().toString(),
                        color: Colors.orange.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    }
                    autoValidateMode = AutovalidateMode.always;
                  },
                );
              },
            ),
            const SizedBox(height: 200)
          ]),
        ),
      ),
    );
  }
}
