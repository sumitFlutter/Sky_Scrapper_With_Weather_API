import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier{
  bool isConnected=false;
  void first()
  async {
    ConnectivityResult firstTime = await Connectivity().checkConnectivity();
    if(firstTime==ConnectivityResult.none)
    {
      isConnected=false;
    }
    else {
      isConnected = true;
    }
      notifyListeners();
  }
  void onChangedConnectivity()
  {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result==ConnectivityResult.none)
      {
        isConnected=false;
      }
      else{
        isConnected=true;
      }
    });

    notifyListeners();
  }
}