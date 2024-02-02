import 'package:todo_app/db/db_creation.dart';
import 'package:todo_app/model/todo_model.dart';

class DbFunctions {
  DBCreation database = DBCreation();

  insertTodoToDB(TodoModel todoModel) async {
    final db = await database.createDB();
    await db.insert(
      'todotable',
      todoModel.toMap(),
    );
  }

   Future<List<TodoModel>> getTodoFromDB() async {
    final db = await database.createDB();
    var values = await db.query('todotable');
    return List.generate(values.length, (index) {
      return TodoModel.fromMap(values[index]);
    });
  }

  updateTodoInDB(TodoModel todoModel) async {
    final db = await database.createDB();
    await db.update('todotable', todoModel.toMap(),
        where: 'id = ?', whereArgs: [todoModel.id]);
  }

  deleteTodoInDB(int id) async {
    final db = await database.createDB();
    await db.delete('todotable', where: 'id = ?', whereArgs: [id]);
  }
}
