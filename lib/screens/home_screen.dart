import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Notes'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8),
            decoration:BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(8)
            ),
            child: IconButton(onPressed: (){}, icon:Icon(Icons.search),splashRadius: 1,),

          ),
        ],
      ),
      body:Column(
        children: [
          NoteItem(),
          SizedBox(height: 10,)
        ],
      )
    );
  }
}
