import 'package:flutter/material.dart';
import 'package:planet_anim/utils/share_helper.dart';
import '../../../utils/jsonhelper.dart';
import '../model/planet_model.dart';

class PlanetProvider with ChangeNotifier{

  List<PlanetModel> planets =[];
  List<String>? planetList = [];
  int? infoIndex;


  Future<void> getData()async{
    JsonHelper jsonHelper = JsonHelper();
    List<PlanetModel> l1= await jsonHelper.jsonToList();
    planets = l1;
    notifyListeners();
  }

  void changeIndex (int index){
    infoIndex = index;
    notifyListeners();
  }

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    List<String>? l1 = await shareHelper.getBookMark();
    if (l1 != null) {
      planetList = l1;
    }
    notifyListeners();
  }

  void addBookMarks() {
    ShareHelper shareHelper = ShareHelper();
    planetList!.add(planets[infoIndex!].name!);
    shareHelper.addBookMark(planetList!);
    getBookMark();
    notifyListeners();
  }

  void removeBookMarks() {
    ShareHelper shareHelper = ShareHelper();
    planetList!.remove(planets[infoIndex!].name!);
    shareHelper.addBookMark(planetList!);
    getBookMark();
    notifyListeners();
  }

}