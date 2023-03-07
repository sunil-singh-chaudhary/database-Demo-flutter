import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:startfirstdemo/bottomTextField.dart';
import 'package:startfirstdemo/db.dart';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _databaseHelper; //SINGLETON DBHELPER
  StreamController<List<Map<String, dynamic>>>? _controller;
  DatabaseHelper._createInstance(); //NAMED CONST TO CREATE INSTANCE OF THE DBHELPER

  String noteTable = 'note_table';
  String id = 'id';
  String title = 'title';

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get instance async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //GET THE PATH TO THE DIRECTORY FOR IOS AND ANDROID TO STORE DB
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}note.db";

    print('DB open and path is ${directory.path}note.db');

    //OPEN/CREATE THE DB AT A GIVEN PATH

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$title TEXT)');
  }

  //FETCH TO GET ALL NOTES
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await instance;
    var result = db.rawQuery("SELECT * FROM $noteTable");
//    var result = await db.query(noteTable, orderBy: "$colPriority ASC");  //WORKS THE SAME CALLED HELPER FUNC
    return result;
  }

  //INSERT OPS
  Future<int> insertNote(DB note) async {
    print('inserting $note.title');
    Database db = await instance;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //GET THE NO:OF NOTES
  Future<int?> getCount() async {
    Database db = await instance;
    List<Map<String, dynamic>> x =
        await db.rawQuery("SELECT COUNT (*) FROM $noteTable");
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  //GET THE 'MAP LIST' [List<Map>] and CONVERT IT TO 'Note List' [List<Note>]
  Future<List<DB>> getNoteList() async {
    var noteMapList = await getNoteMapList(); //GET THE MAPLIST FROM DB

    int count = noteMapList.length; //COUNT OF OBJS IN THE LIST
    print('FETCHING....$count');
    List<DB> noteList = [];
    for (int index = 0; index < count; index++) {
      noteList.add(DB.fromMap(noteMapList[index]));
    }
    return noteList;
  }

  Future<void> deleteTable(String titles) async {
    print('deleting...');
    var db = await instance;
    await db.delete(noteTable, where: "title = ?", whereArgs: [titles]);

    await db.query(noteTable);
  }

  Future<void> close() async {
    Database db = await instance;
    await _controller!.close();
    await db.close();
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await instance;

    return await db.query(noteTable);
  }
}
