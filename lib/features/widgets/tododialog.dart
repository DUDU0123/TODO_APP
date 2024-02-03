import 'package:flutter/material.dart';
import 'package:todo_app/features/widgets/text_field_common_widget.dart';
import 'package:todo_app/features/widgets/text_widget_common.dart';

import '../../constants/colors.dart';

Future<dynamic> todoDialog(BuildContext context,
      {required String hintText,
      required String buttonText,
      required String titleText,
      required TextEditingController controller,
      required void Function()? onPressed}) {
    return showDialog(
      barrierColor: kTransparent,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: TextWidgetCommon(
          text: titleText,
          color: kBlack,
          fontSize: 25,
        ),
        content: TextFieldCommonWidget(
          nameController: controller,
          hintText: hintText,
        ),
        actions: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlack,
                ),
                onPressed: onPressed,
                child: TextWidgetCommon(
                  text: buttonText,
                  color: kWhite,
                )),
          )
        ],
      ),
    );
  }