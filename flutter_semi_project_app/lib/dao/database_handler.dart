import 'package:flutter_semi_project_app/model/photo_album.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(
        path,
        'album.db',
      ),
      onCreate: (database, version) async {
        await database.execute(
          '''CREATE TABLE album (pSeq integer primary key autoincrement, pTitle text, pContent text, pPlace text, pImage text, pDate TEXT as ISO8601 strings ("YYYY-MM-DD"), pGroup integer)''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertPhotoalbum(PhotoAlbum photoAlbum) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into album (pTitle, pContent, pPlace, pImage, pDate, pGroup) values (?,?,?,?,?,?)',
      [
        photoAlbum.pTitle,
        photoAlbum.pContent,
        photoAlbum.pPlace,
        photoAlbum.pImage,
        photoAlbum.pDate,
        photoAlbum.pGroup
      ],
    );

    return result;
  }

  // ViewSelectedPhoto에서 선택한 날짜의 앨범 보여주는 select
  Future<List<PhotoAlbum>> querySelectedPhotoAlbum(String pDate) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from album where pDate = ? ', [pDate]);
    return queryResult.map((e) => PhotoAlbum.fromMap(e)).toList();
  }

  // ViewAllPhoto에서 모든 앨범 보여주는 select
  Future<List<PhotoAlbum>> queryPhotoalbum() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from album');
    return queryResult.map((e) => PhotoAlbum.fromMap(e)).toList();
  }

  Future<int> updateStudent(PhotoAlbum photoAlbum) async {
    final Database db = await openDatabase('album.db');
    int count = await db.rawUpdate(
        'UPDATE album SET ptitle = ?, pContent = ?, pPlace = ?, pDate = ?, pImage = ?, pGroup = ? WHERE pSeq = ?',
        [
          photoAlbum.pTitle,
          photoAlbum.pContent,
          photoAlbum.pPlace,
          photoAlbum.pDate,
          photoAlbum.pImage,
          photoAlbum.pGroup,
          photoAlbum.pSeq,
        ]);
    return count;
  }

  Future<void> closeDB() async {
    final Database db = await openDatabase('album.db');

    await db.close();
  }
}
