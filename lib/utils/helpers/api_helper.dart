import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sky_scrapper_weather_api_project/screen/model/weather_model.dart';

class APIHelper{
  Future<SkyScrapperModel?> skyScrapperGetData(String city)
  async {
    String link = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=0fc9726ca00c4321bb23477cef53f79f";
    var response = await http.get(Uri.parse(link),);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      SkyScrapperModel skyScrapperModel = SkyScrapperModel.mapToModel(json);
      return skyScrapperModel;
    }
    return null;
  }


  }