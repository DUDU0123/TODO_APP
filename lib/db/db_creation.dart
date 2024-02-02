import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBCreation {
  Future<Database> createDB() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE todotable(id INTEGER PRIMARY KEY, todotext TEXT)');
      },
    );

    return db;
  }

  Future<bool> isDBExist() async {
    bool isExist = await databaseExists(join(await getDatabasesPath(), 'todo.db'));
    return isExist;
  }
}
