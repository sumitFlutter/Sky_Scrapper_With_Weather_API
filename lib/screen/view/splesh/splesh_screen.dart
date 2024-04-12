import 'package:flutter/material.dart';
import 'package:sky_scrapper_weather_api_project/utils/helpers/connectivity_helper.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, "home"),);
  }
  @override
  Widget build(BuildContext context) {
    ConnectivityHelper connectivityHelper =ConnectivityHelper();
    connectivityHelper.firstTimeM(context);
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.lightBlue,Colors.purple])),
          ),
          Center(child: Column(mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/image/logo/logo.jpeg",height: 112.5,width: 112.5,fit: BoxFit.cover,),
            SizedBox(height: 5,),
            Text("Sky Scrapper",style: TextStyle(fontWeight: FontWeight.bold),)
          ],),)
        ],
      ),
    ));
  }
}
