import 'package:flutter/material.dart';
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
        routes: {Routes.homeScreen: (context) => HomeScreen()},
        initialRoute: Routes.homeScreen);
  }
}

class Routes {
  static String homeScreen = 'home screen';
}
