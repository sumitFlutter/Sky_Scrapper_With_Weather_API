import 'package:flutter/material.dart';
import 'package:sky_scrapper_weather_api_project/screen/view/home/home_screen.dart';
import 'package:sky_scrapper_weather_api_project/screen/view/splesh/splesh_screen.dart';

Map <String,WidgetBuilder> appRoutes={
  "/":(context) => const SpleshScreen(),
  "home":(context) => const HomeScreen(),
};