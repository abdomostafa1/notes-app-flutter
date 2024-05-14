import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
        decoration: BoxDecoration(
          color: Color(0xffFFCD7F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Flutter tips',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              subtitle:const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child:  Text(
                  'Build your career with tharwat samy',
                  style: TextStyle(color: Color(0xff9C733D),fontSize: 18,),
                ),
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Colors.black,size: 32,)),
            ),
            const Padding(
              padding: EdgeInsets.only(right:24.0),
              child: Text(
                'May 21,2022',
                style: TextStyle(color: Color(0xff9C733D)),
              ),
            )
          ],
        ));
  }
}
