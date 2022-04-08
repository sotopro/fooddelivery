import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';

class MainText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double? height;
  TextOverflow overflow;
  FontWeight? fontWeight;
  int maxLines;
  MainText({
    Key? key,
    this.color = Colors.black45,
    required this.text,
    this.size = 12,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w400,
    this.height = 1.2,
    this.maxLines = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
      overflow: overflow,
    );
  }
}