import 'package:flutter/material.dart';
import 'package:sky_scrapper_weather_api_project/utils/helpers/connectivity_helper.dart';

class ConnectivityProvider with ChangeNotifier{
  bool isConnected=false;
  ConnectivityHelper connectivityHelper =ConnectivityHelper();
  void first()
  async {
    isConnected=(await connectivityHelper.firstTimeM())!;
    notifyListeners();
  }
  void onChangedConnectivity()
  {
    isConnected=connectivityHelper.connectivityCheck()!;
    notifyListeners();
  }
}