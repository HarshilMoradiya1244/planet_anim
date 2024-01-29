import 'dart:convert';
import 'package:flutter/services.dart';
import '../screen/home/model/planet_model.dart';

class JsonHelper {

  Future<List<PlanetModel>> jsonToList() async {
    var jsonToString = await rootBundle.loadString('assets/json/planet.json');
    List planet = jsonDecode(jsonToString);
    List<PlanetModel> modelList =
        planet.map((e) => PlanetModel.mapToModel(e)).toList();
    return modelList;
  }
}
