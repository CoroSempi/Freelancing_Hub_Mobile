import 'package:shared_preferences/shared_preferences.dart';

class AvatarHelper {
  static String _getKeyForUser(String userId) => 'avatar_path_$userId';

  static Future<void> saveAvatarPath(String userId, String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_getKeyForUser(userId), path);
  }

  static Future<String?> getAvatarPath(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_getKeyForUser(userId));
  }

  static Future<void> clearAvatarPath(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getKeyForUser(userId));
  }
}

