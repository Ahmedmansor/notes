import 'package:group_35_notes_app/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static late Database database;
  static init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, dateTime TEXT, body TEXT)');

      // await db.execute(
      // 'CREATE TABLE Model (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, dateTime TEXT, body TEXT)');
    });
  }

  static Future createNote(NoteModel note) async {
    await database.rawInsert(
        'INSERT INTO Note(title, body, dateTime) VALUES("${note.title}", "${note.body}", "${note.dateTime}")');
  }

  static Future<List<NoteModel>> getAllNotes() async {
    List<NoteModel> list = [];
    List<Map> maps = await database.rawQuery('SELECT * FROM Note');

    for (var element in maps) {
      list.add(NoteModel.fromDatabase(element));
    }

    return list;
  }

  static editNote(NoteModel note) {
    database.rawUpdate(
        'UPDATE Note SET title = ?, body = ? , dateTime = ? WHERE id = ?',
        ['${note.title}', '${note.body}', '${note.dateTime}', note.id]);
  }

  static deleteNote(int id) {
    database.rawDelete('DELETE FROM Note WHERE id = ?', [id]);
  }
}
