import 'package:flutter/material.dart';

import '../notes_colors.dart';
import 'color_item.dart';

int selectedColorIndex = 0;
class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  @override
  Widget build(BuildContext context) {
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
                    selectedColorIndex=index;
                  });
                },
                child: ColorItem(
                  color: colors[index],
                  isSelected: selectedColorIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
