import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconbutton extends StatelessWidget {
  const CustomIconbutton({super.key, required this.iconPath, required this.onPressed});
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      height: 54,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: IconButton(onPressed:onPressed, icon: SvgPicture.asset(iconPath)),
    );
  }
}
