import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/sky_scrapper_prrovider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/theme_provider.dart';

import '../../provider/connectivity_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  SkyScrapperProvider? providerR;
  SkyScrapperProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<ConnectivityProvider>().onChangedConnectivity();
    context.read<SkyScrapperProvider>().weatherGetData("Surat");
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SkyScrapperProvider>();
    providerW = context.watch<SkyScrapperProvider>();
    return Scaffold(
        body: context.watch<ConnectivityProvider>().isConnected
            ? providerW!.skyScrapperModel != null
                ? Stack(
                    children: [
                      Image.asset(
                        context.watch<ThemeProvider>().bgImage,
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: providerW!.skyScrapperModel!.name != null
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    providerW!.skyScrapperModel!.name!,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${providerW!.skyScrapperModel!.mainModel!.temp}°C",
                                    style: const TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              )
                            : const Text(
                                "Invalid Place",
                                style: TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: providerW!.skyScrapperModel!.name != null
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Today:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          Text(
                                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 15, left: 15, bottom: 15),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Current Weather's Details:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              Image.asset(
                                                "assets/image/icons/2.png",
                                                height: 25,
                                                fit: BoxFit.cover,
                                              )
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/icons/1.png",
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "Min:-${providerW!.skyScrapperModel!.mainModel!.temp_min}°C",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "Max:-${providerW!.skyScrapperModel!.mainModel!.temp_max}°C",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/icons/3.png",
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "humidity:${providerW!.skyScrapperModel!.mainModel!.humidity}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/icons/5.png",
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "Pressure:${providerW!.skyScrapperModel!.mainModel!.pressure}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/icons/4.png",
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "WindSpeed:${providerW!.skyScrapperModel!.windModel!.speed}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "Degree:-${providerW!.skyScrapperModel!.windModel!.deg}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/icons/8.png",
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "Sunrise:${providerW!.skyScrapperModel!.sysModel!.sunrise}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/icons/9.png",
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "Sunset:${providerW!.skyScrapperModel!.sysModel!.sunset}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "lat:${providerW!.skyScrapperModel!.cordModel!.lat} lon:${providerW!.skyScrapperModel!.cordModel!.lon}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "From which Country:${providerW!.skyScrapperModel!.sysModel!.country}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container()),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 5, left: 5, right: 5),
                        child: SearchBar(
                          elevation: MaterialStateProperty.all(0.5),
                          hintText:
                              "Enter place name which you want to Search. ",
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                          hintStyle: MaterialStateProperty.all(
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          controller: textEditingController,
                          onSubmitted: (value) {
                            providerR!
                                .weatherGetData(textEditingController.text);
                            textEditingController.clear();
                          },
                          backgroundColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.2)),
                          leading: IconButton(
                              onPressed: () {
                                context.read<ThemeProvider>().setTheme();
                              },
                              icon: Icon(
                                context.watch<ThemeProvider>().themeMode,
                                color: Colors.white,
                              )),
                          trailing: [
                            IconButton(
                                onPressed: () {
                                  providerR!.weatherGetData(
                                      textEditingController.text);
                                  textEditingController.clear();
                                },
                                icon: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )
            : Center(
                child: Image.asset(
                  "assets/image/background/no_internet.png",
                  height: 216,
                  width: 384,
                  fit: BoxFit.cover,
                ),
              ));
  }
}
