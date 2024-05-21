import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_note_screen.dart';
import 'package:notes_app/screens/home_screen.dart';

import 'cubits/main_cubit/main_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> MainCubit())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
          ),
          routes: {
            Routes.homeScreen: (context) => const HomeScreen(),
            Routes.editNoteScreen: (context) => const EditNoteScreen()
          },
          initialRoute: Routes.homeScreen),
    );
  }
}

class Routes {
  static String homeScreen = 'home screen';
  static String editNoteScreen = 'edit note screen';
}
