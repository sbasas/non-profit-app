import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';

class CacheService {
  final SharedPreferences _prefs;

  CacheService(this._prefs);

  // Generic cache methods
  Future<void> cacheData<T>({
    required String key,
    required T data,
    Duration? expiry,
  }) async {
    final box = await Hive.openBox('cache');
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'expiry': expiry?.inMilliseconds,
    };
    await box.put(key, cacheData);
  }

  Future<T?> getCachedData<T>(String key) async {
    final box = await Hive.openBox('cache');
    final cacheData = box.get(key) as Map<String, dynamic>?;
    
    if (cacheData == null) return null;
    
    final timestamp = cacheData['timestamp'] as int;
    final expiry = cacheData['expiry'] as int?;
    
    if (expiry != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (now - timestamp > expiry) {
        await box.delete(key);
        return null;
      }
    }
    
    return cacheData['data'] as T;
  }

  Future<void> clearCache() async {
    final box = await Hive.openBox('cache');
    await box.clear();
  }

  // User preferences
  Future<void> setUserPreference(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    }
  }

  T? getUserPreference<T>(String key) {
    if (T == String) {
      return _prefs.getString(key) as T?;
    } else if (T == int) {
      return _prefs.getInt(key) as T?;
    } else if (T == bool) {
      return _prefs.getBool(key) as T?;
    } else if (T == double) {
      return _prefs.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _prefs.getStringList(key) as T?;
    }
    return null;
  }

  Future<void> clearUserPreferences() async {
    await _prefs.clear();
  }

  // Offline data
  Future<void> saveOfflineData<T>({
    required String key,
    required T data,
  }) async {
    final box = await Hive.openBox('offline_data');
    await box.put(key, data);
  }

  Future<T?> getOfflineData<T>(String key) async {
    final box = await Hive.openBox('offline_data');
    return box.get(key) as T?;
  }

  Future<void> clearOfflineData() async {
    final box = await Hive.openBox('offline_data');
    await box.clear();
  }

  // Cache statistics
  Future<Map<String, dynamic>> getCacheStats() async {
    final cacheBox = await Hive.openBox('cache');
    final offlineBox = await Hive.openBox('offline_data');
    
    return {
      'cache_size': cacheBox.length,
      'offline_data_size': offlineBox.length,
      'last_cleared': _prefs.getInt('last_cache_clear') ?? 0,
    };
  }
} 