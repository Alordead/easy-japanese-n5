import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:easy_japanese_n5/model/kana_model.dart';

class DBProvider {
  DBProvider._();

  final String kDatabaseName = "database.db";
  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, kDatabaseName);

    ByteData data = await rootBundle.load(join("assets", kDatabaseName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    return openDatabase(path, readOnly: true);
  }

  getSign(int id) async {
    final db = await database;
    var res = await db.query("hiragana", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Kana.fromMap(res.first) : null;
  }

  Future<List<Kana>> getAllSigns() async {
    final db = await database;
    var res = await db.query("hiragana");
    print(res);

    List<Kana> list =
    res.isNotEmpty ? res.map((c) => Kana.fromMap(c)).toList() : [];

    return list;
  }
}