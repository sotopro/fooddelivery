import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';

class MainTitle extends StatelessWidget {
  Color? color;
  final String title;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;
  MainTitle({
    Key? key,
    this.color = Colors.black87,
    required this.title,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: Dimensions.font20,
        fontWeight: fontWeight,
        color: color ?? AppColors.titleColor,
      ),
      overflow: overflow,
    );
  }
}