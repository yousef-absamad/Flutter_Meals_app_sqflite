import 'package:meal_app_sqflite/features/home/data/model/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper dbHelper = DataBaseHelper();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'meals.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
        CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageUrl TEXT,
        description TEXT, 
        name TEXT,
        rate REAL,
        time TEXT
        )
    ''');
  }

  Future<int> insertMeal(MealModel meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db.insert('meals', mealMap);
  }

  Future<List<MealModel>> getAllMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealsJson = await db.query('meals');
    List<MealModel> meals =
        mealsJson.map((mealJson) => MealModel.fromeMap(mealJson)).toList();
    return meals;
  }

  Future<int> deleteMeal(int id) async {
    Database? db = await database;
    int respons = await db.delete('meals', where: 'id = ?', whereArgs: [id]);
    return respons;
  }
}
