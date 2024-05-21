import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onPressed, this.isLoading = false});

  void Function() onPressed;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox( width: 24,height: 24,
            child:  CircularProgressIndicator(color: Colors.black,))
            : const Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
      ),
    );
  }
}
