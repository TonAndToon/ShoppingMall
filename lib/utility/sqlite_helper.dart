import 'package:path/path.dart';
import 'package:shoppingmall/models/sqlite_model.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteHelper {
  final String nameDatabase = 'shoppingmall.db';
  final int version = 1;
  final String tableDatabase = 'tableOrder';
  final String coloumId = 'id';
  final String coloumIdSeller = 'idSeller';
  final String coloumIdProduct = 'idProduct';
  final String coloumName = 'name';
  final String coloumPrice = 'price';
  final String coloumAmount = 'amount';
  final String coloumSum = 'sum';
  SQLiteHelper() {
    initislDatabase();
  }
  Future<Null> initislDatabase() async {
    await openDatabase(
      join(await getDatabasesPath(), nameDatabase),
      onCreate: (db, version) => db.execute(
        'CREATE TABLE $tableDatabase ($coloumId INTEGER PRIMARY KEY, $coloumIdSeller TEXT, $coloumIdProduct TEXT, $coloumName TEXT, $coloumPrice TEXT, $coloumAmount TEXT, $coloumSum TEXT)',
      ),
      version: version,
    );
  }

  Future<Database> connectedDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), nameDatabase));
  }

  Future<List<SQLiteModel>> readSQLite() async {
    Database database = await connectedDatabase();
    List<SQLiteModel> results = [];
    List<Map<String, dynamic>> maps = await database.query(tableDatabase);
    print('### maps on SQLitHelper ==>> $maps');
    for (var item in maps) {
      SQLiteModel model = SQLiteModel.fromMap(item);
      results.add(model);
    }
    return results;
  }
}
