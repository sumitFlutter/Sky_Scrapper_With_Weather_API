import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/sky_scrapper_prrovider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/theme_provider.dart';
import 'package:sky_scrapper_weather_api_project/utils/helpers/connectivity_helper.dart';

import '../../provider/connectivity_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConnectivityHelper connectivityHelper = ConnectivityHelper();
  TextEditingController textEditingController = TextEditingController();
  SkyScrapperProvider? providerR;
  SkyScrapperProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SkyScrapperProvider>().weatherGetData("Surat");}

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SkyScrapperProvider>();
    providerW = context.watch<SkyScrapperProvider>();
    context.watch<ConnectivityProvider>().onChangedConnectivity();
    return Scaffold(
        body: context.watch<ConnectivityProvider>().isConnected
            ? providerW!.skyScrapperModel!=null?Stack(
                children: [
                  Image.asset(
                    context.watch<ThemeProvider>().bgImage,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 40, bottom: 5, left: 5, right: 5),
                            child: SearchBar(
                              elevation: MaterialStateProperty.all(0.5),
                              hintText:
                                  "Enter place name which you want to Search. ",
                              controller: textEditingController,
                              onSubmitted: (value) {
                                providerR!
                                    .weatherGetData(textEditingController.text);
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
                                    },
                                    icon: Icon(Icons.search_rounded))
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              color: Colors.white.withOpacity(0.5)),
                          child: Center(
                            child: providerW!.skyScrapperModel!.name!=null?Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  providerW!.skyScrapperModel!.name!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "${providerW!.skyScrapperModel!.mainModel!.temp}°C",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ):
                                const Text("Invalid Place", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold),)
                          ),
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
                                  Text(
                                    "Today:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ):Container()
                      ),
                      ],
              ):Center(child: CircularProgressIndicator(),)
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
