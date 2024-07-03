import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> initDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'contact.db'),
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute("""
  CREATE TABLE Person (
  id_person INTEGER PRIMARY KEY AUTOINCREMENT,
  person_name VARCHAR(20) NOT NULL,
  job VARCHAR(20) NOT NULL,
  address VARCHAR(40) NOT NULL,
  email VARCHAR(40) NOT NULL
  )
  """);
      await db.execute("""
  CREATE TABLE Telephone (
  id_telephone INTEGER PRIMARY KEY AUTOINCREMENT,
  telephone_name VARCHAR(20) NOT NULL,
  telephone_number VARCHAR(15) NOT NULL,
  person_id INT NOT NULL REFERENCES Person(id_person)
  )
  """);
    },
  );
}

Future<List<Map<String, Object?>>> getData({required String table, List<String> column = const [], String? search, int? id}) async {
  Database db = await initDatabase();
  String order;
  table == "Person" ? order = 'person_name ASC' : order = 'telephone_name ASC';
  List<Map<String, Object?>> data;
  search == null ? data = await db.query(table, columns: column, orderBy: order) : data = await db.query(table, columns: column, where: '$search = ?', whereArgs: [id], orderBy: order);

  db.close();

  return data;
}

Future<int> insertData(String table, Map<String, Object?> data) async {
  Database db = await initDatabase();
  int result = await db.insert(table, data);

  return result;
}

Future<int> updateData(String table, Map<String, Object?> data, String search, int id) async {
  Database db = await initDatabase();
  int result = await db.update(table, data, where: '$search = ?', whereArgs: [id]);

  return result;
}

Future<int> deleteData(String table, String search, int id) async {
  Database db = await initDatabase();
  int result = await db.delete(table, where: '$search = ?', whereArgs: [id]);

  return result;
}