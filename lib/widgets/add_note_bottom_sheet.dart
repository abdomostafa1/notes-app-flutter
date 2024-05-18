import 'package:flutter/material.dart';
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
            CustomButton(
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                }
                autoValidateMode = AutovalidateMode.always;
              },
            ),
            const SizedBox(height: 200)
          ]),
        ),
      ),
    );
  }
}
