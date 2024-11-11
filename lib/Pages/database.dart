import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'expenses.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expenses(id INTEGER PRIMARY KEY, amount TEXT, category TEXT, date TEXT)',
        );
      },
    );
  }

  // Insert a new expense
  Future<void> insertExpense(Map<String, dynamic> expense) async {
    final db = await database;
    await db.insert('expenses', expense);
  }

  // Get all expenses
  Future<List<Map<String, dynamic>>> getExpenses() async {
    final db = await database;
    return await db.query('expenses');
  }

  // Delete an expense by ID
  Future<void> deleteExpense(int id) async {
    final db = await database;
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Update an expense by ID
  Future<void> updateExpense(int id, Map<String, dynamic> expense) async {
    final db = await database;
    await db.update(
      'expenses',
      expense,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Get monthly expenses by category
  Future<List<Map<String, dynamic>>> getMonthlyExpensesByCategory() async {
    final db = await database;

    // Get current month and year for filtering
    String currentMonth = DateFormat('MM').format(DateTime.now());
    String currentYear = DateFormat('yyyy').format(DateTime.now());

    // Query to group expenses by category for the current month
    return await db.rawQuery('''
      SELECT category, SUM(amount) as totalAmount 
      FROM expenses 
      WHERE strftime('%m', date) = ? AND strftime('%Y', date) = ? 
      GROUP BY category
    ''', [currentMonth, currentYear]);
  }

  // Get weekly expenses by category
  Future<List<Map<String, dynamic>>> getWeeklyExpensesByCategory() async {
    final db = await database;

    // Calculate start and end of the current week
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    // Format dates for database query
    String startDate = DateFormat('yyyy-MM-dd').format(startOfWeek);
    String endDate = DateFormat('yyyy-MM-dd').format(now);

    // Query to group expenses by category for the current week
    return await db.rawQuery('''
      SELECT category, SUM(amount) as totalAmount 
      FROM expenses 
      WHERE date BETWEEN ? AND ? 
      GROUP BY category
    ''', [startDate, endDate]);
  }
}
