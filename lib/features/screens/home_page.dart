import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/height_width.dart';
import 'package:todo_app/features/widgets/empty_default_widget.dart';
import 'package:todo_app/features/widgets/error_snackbar.dart';
import 'package:todo_app/features/widgets/floating_button.dart';
import 'package:todo_app/features/widgets/text_widget_common.dart';
import 'package:todo_app/features/widgets/tododialog.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/todo_bloc/todo_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController _editTodoController = TextEditingController();
  TextEditingController _addTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodoBloc>(context).add(TodoLoadEvent());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgetCommon(
          text: "TODO",
          color: kWhite,
          fontWeight: FontWeight.w500,
          fontSize: 25,
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoadedState) {
            return state.todoList.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    itemCount: state.todoList.length,
                    separatorBuilder: (context, index) => kHeight10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: tileColor,
                        title: TextWidgetCommon(
                          text: '${state.todoList[index].todotext}',
                          color: kWhite,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await todoDialog(
                                  context,
                                  hintText: "Enter Todo..",
                                  buttonText: "Save",
                                  titleText: "Edit Todo",
                                  controller: _editTodoController,
                                  onPressed: () {
                                    if (_editTodoController.text != null &&
                                        _editTodoController.text.isNotEmpty) {
                                      final todoModel = TodoModel(
                                        id: state.todoList[index].id,
                                        todotext: _editTodoController.text,
                                      );
                                      BlocProvider.of<TodoBloc>(context).add(
                                          TodoUpdateEvent(
                                              todoModel: todoModel));
                                      Navigator.pop(context);
                                      _editTodoController.clear();
                                    } else {
                                      errorSnackBar(context);
                                    }
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: kBlack.withOpacity(0.7),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: TextWidgetCommon(
                                      text: "Delete Todo",
                                      color: kBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                    ),
                                    content: TextWidgetCommon(
                                      text: "Do you want to delete this todo?",
                                      color: kBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kBlack,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: TextWidgetCommon(
                                          text: "Cancel",
                                          color: kWhite,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kRed,
                                        ),
                                        onPressed: () {
                                          if (state.todoList[index].id !=
                                              null) {
                                            BlocProvider.of<TodoBloc>(context)
                                                .add(TodoDeleteEvent(
                                                    todoId: state
                                                        .todoList[index].id!));
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: TextWidgetCommon(
                                          text: "Delete",
                                          color: kWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: kBlack.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const EmptyDefaultWidget();
          } else if (state is TodoErrorState) {
            return Center(
              child: TextWidgetCommon(text: state.error, color: kBlack),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton:
          FloatingButtonWidget(addTodoController: _addTodoController),
    );
  }
}
