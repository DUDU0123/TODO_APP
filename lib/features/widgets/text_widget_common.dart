import 'package:flutter/material.dart';

class TextWidgetCommon extends StatelessWidget {
  const TextWidgetCommon({super.key, required this.text, this.textAlign, this.maxLines, this.overflow, this.softWrap, required this.color, this.fontSize, this.fontWeight});

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
       
      ),
    );
  }
}
