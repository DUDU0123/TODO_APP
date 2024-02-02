part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoadingState extends TodoState{}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todoList;
  TodoLoadedState({
    required this.todoList,
  });
}

class TodoErrorState extends TodoState {
  final String error;
  TodoErrorState({
    required this.error,
  });
  
}
