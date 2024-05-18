import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
              splashRadius: 1,
            ),
          ),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height:24),
            CustomTextField(hint: 'title', onSave: (String? value) {  },),
            const SizedBox(height:24),
            CustomTextField(hint: 'content',maxLines: 5, onSave: (String? value) {  },)
          ]
        ),
      )
    );
  }
}
