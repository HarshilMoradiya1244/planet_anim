import 'package:flutter/material.dart';
import '../../../utils/jsonhelper.dart';
import '../model/planet_model.dart';

class PlanetProvider with ChangeNotifier{

  List<PlanetModel> planets =[];

  Future<void> getData()async{
    JsonHelper jsonHelper = JsonHelper();
    List<PlanetModel> l1= await jsonHelper.jsonToList();
    planets = l1;
    notifyListeners();
  }

}