import 'package:flutter/material.dart';
import 'package:planet_anim/utils/share_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight = true;
  bool changeUI=false;


  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}