import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/db/db_creation.dart';
import 'package:todo_app/db/db_functions.dart';
import 'package:todo_app/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  DbFunctions dbFn = DbFunctions();
  DBCreation db = DBCreation();
  TodoBloc() : super(TodoInitial()) {
    on<TodoLoadEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        if (await db.isDBExist()) {
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        } else {
          final dB = await db.createDB();
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        }
      } catch (e) {
        emit(TodoErrorState(error: e.toString()));
      }
    });


    on<TodoAddEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        if (await db.isDBExist()) {
          await dbFn.insertTodoToDB(event.todoModel);
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        } else {
          final dB = await db.createDB();
          await dbFn.insertTodoToDB(event.todoModel);
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        }
      } catch (e) {
        emit(TodoErrorState(error: e.toString()));
      }
    });

    on<TodoUpdateEvent>((event, emit) async {
      try {
        if (await db.isDBExist()) {
          await dbFn.updateTodoInDB(event.todoModel);
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        } else {
          final dB = await db.createDB();
          await dbFn.updateTodoInDB(event.todoModel);
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        }
      } catch (e) {
        emit(TodoErrorState(error: e.toString()));
      }
    });

    on<TodoDeleteEvent>((event, emit) async {
      try {
        if (await db.isDBExist()) {
          await dbFn.deleteTodoInDB(event.todoId);
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        } else {
          final dB = await db.createDB();
          await dbFn.deleteTodoInDB(event.todoId);
          final todoList = await dbFn.getTodoFromDB();
          emit(TodoLoadedState(todoList: todoList));
        }
      } catch (e) {
        emit(TodoErrorState(error: e.toString()));
      }
    });
  }
}
