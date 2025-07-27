import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/new_screen.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color bgColor;
  final IconData firstIcon;
  final IconData secondIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.bgColor,
    required this.firstIcon,
    required this.secondIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () {}, child: Icon(firstIcon, size: 40)),
          Text(title),
          Icon(secondIcon, size: 40),
        ],
      ),
    );
  }
}
