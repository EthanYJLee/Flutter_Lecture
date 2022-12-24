//** Dao 개념과 유사 */
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'model/students.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(
        path,
        'students.db',
      ),
      onCreate: (database, version) async {
        await database.execute(
            'create table students (id integer primary key autoincrement, code text, name text, dept text, phone text)');
      },
      version: 1,
    );
  }

  Future<int> insertStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into students(code, name, dept, phone) values(?,?,?,?)',
      [student.code, student.name, student.dept, student.phone],
    );

    return result;
  }

  Future<List<Students>> queryStudents() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from students');
    return queryResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<List<Students>> selectStudent(String code) async {
    final Database db = await openDatabase('students.db');
    List<Map<String, Object?>> selectResult = await db.rawQuery(
        'select code, name, dept, phone from students where code = ?');
    return selectResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<int> updateStudent(Students student) async {
    final Database db = await openDatabase('students.db');
    int count = await db.rawUpdate(
        'UPDATE students SET name = ?, dept = ?, phone = ? WHERE code = ?',
        [student.name, student.dept, student.phone, student.code]);
    return count;
  }
}
