import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/notes_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.05),
                  borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                splashRadius: 1,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))),
                context: context,
                builder: (context) => AddNoteBottomSheet(),
              );
            },
            child: Icon(Icons.add, color: Colors.black),
            backgroundColor: primaryColor ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [Expanded(child: NotesListView())],
          ),
        ));
  }
}
