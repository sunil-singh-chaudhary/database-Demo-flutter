import 'package:flutter/material.dart';
import 'package:startfirstdemo/DatabaseHelper.dart';
import 'package:startfirstdemo/db.dart';

class MyData extends ChangeNotifier {
  List<DB> _data = [];
  final DatabaseHelper db = DatabaseHelper();
  List<DB> get updated_data => _data;

  Future<void> getData() async {
    print('start notifiying');
    _data = await db.getNoteList();
    notifyListeners();
  }

  Future<void> insertData(DB note) async {
    print('start inserting');
    await db.insertNote(note);
    await getData();
  }

  // Future<void> updateData(int id, String name) async {
  //   await db.updateData(id, name);
  //   await getData();
  // }

  Future<void> deleteData(String titles) async {
    print('start deleteing');
    await db.deleteTable(titles);
    await getData();
  }
}
