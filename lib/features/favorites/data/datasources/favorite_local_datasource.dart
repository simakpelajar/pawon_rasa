import 'package:sqflite/sqflite.dart';
import 'package:pawon_rasa/shared/core/infrastructure/database/database_helper.dart';

class FavoriteLocalDataSource {
  final DatabaseHelper _dbHelper;

  FavoriteLocalDataSource(this._dbHelper);

  Future<List<Map<String, dynamic>>> getAllFavorites() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'favorites',
      orderBy: 'createdAt DESC',
    );
    return result;
  }

  Future<Map<String, dynamic>?> getFavoriteById(String id) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<bool> isFavorite(String id) async {
    final result = await getFavoriteById(id);
    return result != null;
  }

  Future<int> insertFavorite(Map<String, dynamic> favorite) async {
    final db = await _dbHelper.database;
    return await db.insert(
      'favorites',
      favorite,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteFavorite(String id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
