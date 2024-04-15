import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/connectivity_provider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/sky_scrapper_prrovider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/theme_provider.dart';
import 'package:sky_scrapper_weather_api_project/utils/routes/sky_routes.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ConnectivityProvider()),
        ChangeNotifierProvider.value(value: ThemeProvider()),
        ChangeNotifierProvider.value(value: SkyScrapperProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value,child) {
          value.getTheme();
          value.theme=value.pTheme;
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: value.mode,
            routes: appRoutes,
          );
        },
      ),
    ),
  );
}