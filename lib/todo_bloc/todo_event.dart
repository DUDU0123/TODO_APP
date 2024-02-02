part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoLoadEvent extends TodoEvent{}

class TodoAddEvent extends TodoEvent {
  final TodoModel todoModel;
  TodoAddEvent({
    required this.todoModel,
  });
}

class TodoUpdateEvent extends TodoEvent{
  final TodoModel todoModel;
  TodoUpdateEvent({
    required this.todoModel,
  });
}

class TodoDeleteEvent extends TodoEvent {
  final int todoId;
  TodoDeleteEvent({
    required this.todoId,
  });
}
