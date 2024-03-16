import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/features/widgets/text_widget_common.dart';

errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 500),
      behavior: SnackBarBehavior.floating,
      backgroundColor: tileColor,
      content: TextWidgetCommon(
        text: "Enter todo",
        color: kWhite,
      ),
    ),
  );
}