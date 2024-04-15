import 'package:connectivity_plus/connectivity_plus.dart';
class ConnectivityHelper{
  bool? isConnect;
  bool? connectivityCheck() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if(result.contains(ConnectivityResult.none))
      {
        isConnect=false;
        result.clear();
         }
      else{
       isConnect=true;
       result.clear();
      }
    });
    return isConnect;
  }
  Future<bool?> firstTimeM() async {
    List<ConnectivityResult> firstTime = await Connectivity().checkConnectivity();
    if(firstTime.contains(ConnectivityResult.none))
    {
      isConnect=false;
        }
    else{
      isConnect=true;
    }
    return isConnect;
  }
}
