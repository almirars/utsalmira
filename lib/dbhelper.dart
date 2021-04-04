import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:stok_anggrek/item/item.dart';
import 'package:stok_anggrek/supp/supplier.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
//untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'stokAnggrek.db';
//create, read databases
    var database = openDatabase(path,
        version: 4, onCreate: _createDb, onUpgrade: _onUpgrade);
//mengembalikan nilai object sebagai hasil dari fungsinya
    return database;
  }

// update table baru
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

//buat tabel baru
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS item');
    batch.execute('DROP TABLE IF EXISTS supplier');
    batch.execute('''
    CREATE TABLE item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name String,
    price INT,
    stok INT
    )
    ''');
    batch.execute('''
    CREATE TABLE supplier (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama String,
    alamat String
    )
     ''');
    await batch.commit();
  }

//select databases
  Future<List<Map<String, dynamic>>> selectItem() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectSupp() async {
    Database db = await this.initDb();
    var mapList = await db.query('supplier', orderBy: 'nama');
    return mapList;
  }

//create databases
  Future<int> insertItem(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  Future<int> insertSupp(Supplier object) async {
    Database db = await this.initDb();
    int count = await db.insert('supplier', object.toMap());
    return count;
  }

//update databases
  Future<int> updateItem(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> updateSupp(Supplier object) async {
    Database db = await this.initDb();
    int count = await db.update('supplier', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> deleteItem(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<int> deleteSupp(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('supplier', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await selectItem();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  Future<List<Supplier>> getSupplierList() async {
    var supplierMapList = await selectSupp();
    int count = supplierMapList.length;
    List<Supplier> supplierList = List<Supplier>();
    for (int i = 0; i < count; i++) {
      supplierList.add(Supplier.fromMap(supplierMapList[i]));
    }
    return supplierList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
