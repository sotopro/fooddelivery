import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/widgets/main_text.dart';

class MainIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  Color textcolor;
  Color iconColor;
  double textSize;
  double iconSize;
  double padding;
  double margin;
  FontWeight fontWeight;
  TextOverflow overflow;
  int maxLines;
  MainIconText({
    Key? key,
    required this.icon,
    required this.text,
    this.textcolor = Colors.black45,
    this.textSize = 12,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.iconColor = Colors.black45,
    this.iconSize = 20,
    this.padding = 0,
    this.margin = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(
          width: 10,
        ),
        MainText(
          text: text,
          color: textcolor,
          size: textSize,
          fontWeight: fontWeight,
          overflow: overflow,
          maxLines: maxLines,
        ),
      ],
    );
  }
}