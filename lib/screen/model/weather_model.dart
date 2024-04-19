class SkyScrapperModel
{
  String? base,name;
  int? visibility,dt,timezone,id,cod;
  List<WeatherModel>? weatherList=[];
  MainModel? mainModel;
  WindModel?windModel;
  CloudsModel?cloudsModel;
  SysModel?sysModel;
  CordModel?cordModel;

  SkyScrapperModel(
      {this.base,
        this.visibility,
        this.dt,
        this.timezone,
        this.id,
        this.cod,
        this.weatherList,
        this.mainModel,
        this.windModel,
        this.cloudsModel,
        this.sysModel,this.name,this.cordModel});
  factory SkyScrapperModel.mapToModel(Map m1)
  {
    List data=m1['weather'];
    List<WeatherModel> list=data.map((e) => WeatherModel.mapToModel(e)).toList();
    return SkyScrapperModel(base:m1['m1'] ,visibility:m1['m1'] ,dt:m1['dt'] ,timezone: m1['m1'],id:m1['id'] ,cod:m1['cod'] ,weatherList: list,mainModel:MainModel.mapToModel(m1['main']) ,windModel:WindModel.mapToModel(m1['wind']) ,cloudsModel: CloudsModel.mapToModel(m1['clouds']),sysModel:SysModel.mapToModel(m1['sys']),name: m1['name'],cordModel:CordModel.mapToModel(m1['coord']));
  }
}
class WeatherModel
{
  int?id;
  String?main,description,icon;

  WeatherModel({this.id, this.main, this.description, this.icon});
  factory WeatherModel.mapToModel(Map m1)
  {
    return WeatherModel(id:m1['id'], main:m1['main'], description:m1['description'], icon:m1['icon']);
  }
}
class MainModel
{
  double?temp,feels_like,temp_min,temp_max;
  int?pressure,humidity;

  MainModel(
      {this.temp,
        this.feels_like,
        this.temp_min,
        this.temp_max,
        this.pressure,
        this.humidity});

  factory MainModel.mapToModel(Map m1)
  {
    return MainModel(temp: m1['temp'],feels_like: m1['feels_like'],humidity: m1['humidity'],pressure:m1['pressure'] ,temp_max:m1['temp_max'] ,temp_min:m1['temp_min'] );
  }
}
class WindModel
{
  num?speed,deg;


  WindModel({this.speed, this.deg});
  factory WindModel.mapToModel(Map m1)
  {
    return WindModel(speed:m1['speed'],deg:m1['deg']);
  }
}
class CloudsModel
{
  int?all;

  CloudsModel({this.all});
  factory CloudsModel.mapToModel(Map m1)
  {
    return CloudsModel(all: m1['all']);
  }
}
class SysModel
{
  int?type,id,sunrise,sunset;
  String?country;

  SysModel({this.type, this.id, this.sunrise, this.sunset, this.country});
  factory SysModel.mapToModel(Map m1)
  {
    return SysModel(type:m1['type'] ,id:m1['id'] ,sunrise: m1['sunrise'],sunset:m1['sunset'] ,country:m1['country'] );
  }
}
class CordModel
{
  double?lon,lat;

  CordModel({this.lon, this.lat});
  factory CordModel.mapToModel(Map m1)
  {
    return CordModel(lon: m1['lon'],lat: m1['lat']);
  }
}
