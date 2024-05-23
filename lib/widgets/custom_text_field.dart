import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSave,
      this.onChanged,
      this.initialValue});

  final String hint;
  final int maxLines;
  String? initialValue;
  void Function(String? value)? onSave;
  void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        onSaved: onSave,
        maxLines: maxLines,
        cursorColor: primaryColor,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            return null;
          } else {
            return 'field is required';
          }
        },
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: primaryColor),
            border: buildOutlinedBorder(),
            enabledBorder: buildOutlinedBorder(),
            focusedBorder: buildOutlinedBorder(primaryColor)));
  }

  OutlineInputBorder buildOutlinedBorder([Color? color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
