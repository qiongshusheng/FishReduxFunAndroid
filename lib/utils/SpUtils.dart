import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  static Future<bool> putString(String key, var str) async {
    print('the str is $str');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, str);
  }

  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
