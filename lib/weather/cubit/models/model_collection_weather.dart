import 'model_weather.dart';

abstract class ICollectionWeather {
  List<IWeather> get listWeatherDay;
  List<IWeather> get listWeatherHour;
  set setWeatherDay(IWeather weather);
  set setWeatherHour(IWeather weather);
  bool get isRedy;
}

class CollectionWeather implements ICollectionWeather {
  List<IWeather> _listWeatherDay = [];
  List<IWeather> _listWeatherHour = [];
  @override
  List<IWeather> get listWeatherDay => _listWeatherDay;

  @override
  List<IWeather> get listWeatherHour => _listWeatherHour;

  @override
  set setWeatherDay(IWeather weather) {
    _listWeatherDay.add(weather);
  }

  @override
  set setWeatherHour(IWeather weather) {
    _listWeatherHour.add(weather);
  }

  @override
  bool get isRedy => _listWeatherDay.isNotEmpty && _listWeatherHour.isNotEmpty;
}
