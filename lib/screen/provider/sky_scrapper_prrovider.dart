import 'package:flutter/material.dart';
import 'package:sky_scrapper_weather_api_project/screen/model/weather_model.dart';
import 'package:sky_scrapper_weather_api_project/utils/helpers/api_helper.dart';

class SkyScrapperProvider with ChangeNotifier{
  APIHelper apiHelper=APIHelper();
  SkyScrapperModel? skyScrapperModel;
  void weatherGetData(String city) async {
    skyScrapperModel=null;
    if (await apiHelper.skyScrapperGetData(city)!= null) {
      SkyScrapperModel? skyScrapperModelData =await apiHelper.skyScrapperGetData(city);
      skyScrapperModel = skyScrapperModelData;
      notifyListeners();
    }
  }

}