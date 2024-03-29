import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  void setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }

  Future<void> addBookMark(List<String> planetList) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("favorite", planetList);
  }

  Future<List<String>?> getBookMark() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("favorite");
  }

}