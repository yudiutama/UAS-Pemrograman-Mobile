import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:tanistore/models/penjualan.dart';

class DbHelper{
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  factory DbHelper(){
    if(_dbHelper == null){
      _dbHelper=DbHelper._createObject();
    }
    return _dbHelper;
  }
  //mendeklarasikan nama tabel melalui initDb
  Future<Database> initDb() async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path = directory.path + 'penjualan.db';
    var todoDatabase=openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }
  void _createDb(Database db, int version) async{
    await db.execute('''
      CREATE TABLE penjualan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        keterangan TEXT,
        jumlah TEXT,
        tanggal TEXT
      )
    ''');
  }
  Future<Database> get database async{
    if(_database == null){
      _database= await initDb();
    }
    return _database;
  }
  Future<List<Map<String, dynamic>>> select() async{
    Database db = await this.database;
    var mapList= await db.query('penjualan', orderBy: 'name');
    return mapList;
  }
  Future<int> insert(Penjualan object) async{
    Database db = await this.database;
    int count = await db.insert('penjualan', object.toMap());
    return count;
  }
  Future<int> update(Penjualan object) async{
    Database db = await this.database;
    int count = await db.update('penjualan', object.toMap(), where: 'id=?',whereArgs: [object.id]);
    return count;
  }
  Future<int> delete(int id) async{
    Database db = await this.database;
    int count = await db.delete('penjualan', where: 'id=?',whereArgs: [id]);
    return count;
  }
  Future<List<Penjualan>> getPenjualanList() async{
    var penjualanMapList=await select();
    int count=penjualanMapList.length;
    print("INI JUMLAH $count");
    // ignore: deprecated_member_use
    List<Penjualan> penjualanList=List<Penjualan>();
    for(int i=0; i<count; i++){
      penjualanList.add(Penjualan.fromMap(penjualanMapList[i]));
    }
    return penjualanList;
  }
}