
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/features/widgets/error_snackbar.dart';
import 'package:todo_app/features/widgets/tododialog.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/todo_bloc/todo_bloc.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
    required TextEditingController addTodoController,
  }) : _addTodoController = addTodoController;

  final TextEditingController _addTodoController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: tileColor,
      onPressed: () async {
        await todoDialog(
          context,
          hintText: "Enter Todo..",
          buttonText: "Save",
          titleText: "Add Todo",
          controller: _addTodoController,
          onPressed: () {
            if (_addTodoController.text.isNotEmpty) {
              final todoModel = TodoModel(
                todotext: _addTodoController.text,
              );
              BlocProvider.of<TodoBloc>(context)
                  .add(TodoAddEvent(todoModel: todoModel));
              Navigator.pop(context);
              _addTodoController.clear();
            } else {
              errorSnackBar(context);
            }
          },
        );
      },
      child: Icon(
        Icons.add,
        size: 30,
        color: kWhite,
      ),
    );
  }
}