import 'package:flutter/material.dart';
import 'package:notes_app/screens/edit_note_screen.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        routes: {
          Routes.homeScreen: (context) => const HomeScreen(),
          Routes.editNoteScreen: (context) => const EditNoteScreen()
        },
        initialRoute: Routes.homeScreen);
  }
}

class Routes {
  static String homeScreen = 'home screen';
  static String editNoteScreen = 'edit note screen';
}
