import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../notes_colors.dart';
import 'color_item.dart';

class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  @override
  Widget build(BuildContext context) {
    final addNoteCubit=BlocProvider.of<AddNoteCubit>(context);
    return SizedBox(
      height: 56,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    addNoteCubit.selectedColorIndex=index;
                  });
                },
                child: ColorItem(
                  color: colors[index],
                  isSelected: addNoteCubit.selectedColorIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
