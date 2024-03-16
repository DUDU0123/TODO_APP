import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/features/widgets/text_widget_common.dart';

class EmptyDefaultWidget extends StatelessWidget {
  const EmptyDefaultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextWidgetCommon(
          text: "No Todo Available",
          color: tileColor.withOpacity(0.5),
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
  }
}