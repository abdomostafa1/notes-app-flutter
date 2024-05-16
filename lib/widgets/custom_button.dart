import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8))),
        onPressed: () {},
        child: Text(
          'Add',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
