import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/user.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(
        path,
        'user.db',
      ),
      onCreate: (database, version) async {
        await database.execute(
            'create table user (uSeq integer primary key autoincrement, uId text, uPassword text)');
      },
      version: 1,
    );
  }

  // 유저 회원가입
  Future<int> userRegister(User user) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into user(uId, uPassword) values(?,?)',
      [user.uId, user.uPassword],
    );
    return result;
  }

  // Future<List<User>> queryUser() async {
  //   final Database db = await initializeDB();
  //   final List<Map<String, Object?>> queryResult =
  //       await db.rawQuery('select * from user');
  //   return queryResult.map((e) => User.fromMap(e)).toList();
  // }

  // 테이블에서 로그인 시도한 ID와 Password 갯수 확인하고 1이면 로그인 성공
  Future<int> checkUser(String uId, String uPassword) async {
    final Database db = await openDatabase('user.db');
    int count = 0;
    count = (await db.query(
        'select count(*) from user where uId = ? and uPassword = ?')) as int;
    return count;
  }

  // 컬럼 추가한 뒤에 수정할것
  // Future<int> updateStudent(User user) async {
  //   final Database db = await openDatabase('user.db');
  //   int count = await db.rawUpdate(
  //       'UPDATE user SET ~~~~~~~~~~~~~~~',
  //       [user.~~~, user.~~~]);
  //   return count;
  // }
}
