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
      backgroundColor: Colors.blueAccent,
        body: context.watch<ConnectivityProvider>().isConnected
            ? providerW!.skyScrapperModel!=null?Stack(
                children: [Image.asset(
                  context.watch<ThemeProvider>().bgImage,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                ),
                      Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: providerW!.skyScrapperModel!.name!=null?Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                providerW!.skyScrapperModel!.name!,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "${providerW!.skyScrapperModel!.mainModel!.temp}°C",
                                style: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ):
                              const Text("Invalid Place", style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),)
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: providerW!.skyScrapperModel!.name!=null?
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Today:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Column(mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                const Text("Current Weather's Details:"),
                                  Image.asset("assets/image/icons/2.png",height: 25,fit: BoxFit.cover,)
                              ],),
                              const Divider(),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/image/icons/1.png",height: 25,fit: BoxFit.cover,),
                                    const SizedBox(width: 1,),
                                    const Text("Temperature:"),
                                  ],),
                                Row(
                                  children: [
                                    const Text("Min:-"),
                                    const SizedBox(width: 1,),
                                    Text("${providerW!.skyScrapperModel!.mainModel!.temp_min}°C")
                                  ],),
                                Row(
                                  children: [
                                    const Text("Max:-"),
                                    const SizedBox(width: 1,),
                                    Text("${providerW!.skyScrapperModel!.mainModel!.temp_max}°C")
                                  ],),

                              ],),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/image/icons/3.png",height: 25,fit: BoxFit.cover,),
                                      const SizedBox(width: 1,),
                                      const Text("humidity:"),
                                      Text("${providerW!.skyScrapperModel!.mainModel!.humidity}")
                                    ],),
                                  Row(
                                    children: [
                                      Image.asset("assets/image/icons/5.png",height: 25,fit: BoxFit.cover,),
                                      const SizedBox(width: 1,),
                                      const Text("Pressure:"),
                                      Text("${providerW!.skyScrapperModel!.mainModel!.pressure}")
                                    ],),
                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/image/icons/4.png",height: 25,fit: BoxFit.cover,),
                                      const SizedBox(width: 1,),
                                      const Text("WindSpeed:"),
                                      Text("${providerW!.skyScrapperModel!.windModel!.speed}    and Degree:-${providerW!.skyScrapperModel!.windModel!.deg}")
                                    ],),
                                  Row(
                                    children: [
                                      Image.asset("assets/image/icons/8.png",height: 25,fit: BoxFit.cover,),
                                      const SizedBox(width: 1,),
                                      const Text("sunrise:"),
                                      Text("${providerW!.skyScrapperModel!.sysModel!.sunrise}")
                                    ],),

                                ],
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/image/icons/9.png",height: 25,fit: BoxFit.cover,),
                                      const SizedBox(width: 1,),
                                      const Text("Sunset:"),
                                      Text("${providerW!.skyScrapperModel!.sysModel!.sunset}")
                                    ],),
                                  Row(
                                    children: [
                                      Image.asset("assets/image/icons/6.png",height: 25,fit: BoxFit.cover,),
                                      const SizedBox(width: 1,),
                                      const Text("Place id:"),
                                      Text("${providerW!.skyScrapperModel!.id}")
                                    ],),
                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text("lat:${providerW!.skyScrapperModel!.cordModel!.lat} lon:${providerW!.skyScrapperModel!.cordModel!.lon}"),
                                  Row(
                                    children: [
                                      const Text("From which Country:"),
                                      Text("${providerW!.skyScrapperModel!.sysModel!.country}")
                                    ],),
                                ],
                              ),



                            ],),
                          ],
                        ):Container()
                      ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 5, left: 5, right: 5),
                    child: SearchBar(
                      elevation: MaterialStateProperty.all(0.5),
                      hintText:
                      "Enter place name which you want to Search. ",
                      controller: textEditingController,
                      onSubmitted: (value) {
                        providerR!
                            .weatherGetData(textEditingController.text);
                        textEditingController.clear();
                      },
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.5)),
                      leading: IconButton(
                          onPressed: () {
                            context.read<ThemeProvider>().setTheme();
                          },
                          icon: Icon(context
                              .watch<ThemeProvider>()
                              .themeMode)),
                      trailing: [
                        IconButton(
                            onPressed: () {
                              providerR!.weatherGetData(
                                  textEditingController.text);
                              textEditingController.clear();
                            },
                            icon: const Icon(Icons.search_rounded))
                      ],
                    ),
                  ),


                ],
              ):const Center(child: CircularProgressIndicator(),)
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
