import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/sky_scrapper_prrovider.dart';
import 'package:sky_scrapper_weather_api_project/screen/provider/theme_provider.dart';
import 'package:sky_scrapper_weather_api_project/utils/helpers/connectivity_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConnectivityHelper connectivityHelper = ConnectivityHelper();
  TextEditingController textEditingController=TextEditingController();
  SkyScrapperProvider? providerR;
  SkyScrapperProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR=context.read<SkyScrapperProvider>();
    providerW=context.watch<SkyScrapperProvider>();
    connectivityHelper.connectivityCheck(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Sky Scrapper"),
        actions: [
          IconButton(onPressed: () {
            context.read<ThemeProvider>().setTheme();
          },icon: Icon(context.watch<ThemeProvider>().themeMode)),
        ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
             child:Image.asset("assets/image/background/back.jpg",fit: BoxFit.cover,),
            ),
            if(providerW!.skyScrapperModel==null)
              Center(child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [

                    SearchBar(controller: textEditingController,
                      hintText: "Search Here Any Place",
                      onSubmitted: (value) async {
                       providerR!.weatherGetData(textEditingController.text);
                        textEditingController.clear();
                      },
                      elevation: MaterialStateProperty.all(0.5),trailing: [IconButton(onPressed: () {
                        providerR!.weatherGetData(textEditingController.text);
                        textEditingController.clear();
                      }, icon: const Icon(Icons.search_rounded))],),
                    const Text("No Data Found"),
                  ],
                ),
              ),)
           else if(providerW!.skyScrapperModel!=null)
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SearchBar(controller: textEditingController,
                        hintText: "Search Here Any Place",
                        onSubmitted: (value) {
                          providerR!.weatherGetData(textEditingController.text);
                          textEditingController.clear();
                        },
                        elevation: MaterialStateProperty.all(0.5),trailing: [IconButton(onPressed: () {
                        providerR!.weatherGetData(textEditingController.text);
                        textEditingController.clear();
                      }, icon: const Icon(Icons.search_rounded))],),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  height: MediaQuery.sizeOf(context).height * 0.25,
                                  width: MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [Colors.blue, Colors.grey ],
                                    ),),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Text("id:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                              Text("${providerW!.skyScrapperModel!.weatherList![0].id}"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Name:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                              Text("${providerW!.skyScrapperModel!.name}"),
                                             ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Description:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                              Text("${providerW!.skyScrapperModel!.weatherList![0].description}"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("temp:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                              Text("${providerW!.skyScrapperModel!.mainModel!.temp}°C"),
                                            ],
                                          ),
                                        ],
                                      ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  height: MediaQuery.sizeOf(context).height * 0.25,
                                  width: MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [Colors.blue, Colors.grey ],
                                    ),
                                  ),
                                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("feels_like:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.mainModel!.feels_like}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("temp-min:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.mainModel!.temp_min}°C"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("temp_max:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.mainModel!.temp_max}°C"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Pressure:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.mainModel!.pressure}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  height: MediaQuery.sizeOf(context).height * 0.25,
                                  width: MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [Colors.blue, Colors.grey ],
                                    ),
                                  ),
                                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Spped:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.windModel!.speed}KM/H"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("deg:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.windModel!.deg}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("all:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.cloudsModel!.all}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Country:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.sysModel!.country}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  height: MediaQuery.sizeOf(context).height * 0.25,
                                  width: MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [Colors.blue, Colors.grey],
                                    ),
                                  ),
                                 child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Sunrise:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.sysModel!.sunrise}KM/H"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Sunset:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.sysModel!.sunset}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("main:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.weatherList![0].main}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Cod:",style: TextStyle(fontWeight: FontWeight.bold) ,),
                                          Text("${providerW!.skyScrapperModel!.cod}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            else const Center(child: CircularProgressIndicator(),)
          ],
        )
      ),
    );
  }
}
