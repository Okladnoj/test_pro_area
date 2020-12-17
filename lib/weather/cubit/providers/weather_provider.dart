import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import '../models/model_weather.dart';
import '../models/model_collection_weather.dart';
import '../../settings/setting.dart';

abstract class ICarrentWeather {
  /// Получение объкта погоды со списками информации на день и на час
  Future<ICollectionWeather> getCollectionWeather();
}

class CarrentWeather implements ICarrentWeather {
  final double _lat;
  final double _lon;
  final int _cnt;

  const CarrentWeather({
    @required double lat,
    @required double lon,
    int cnt = 1,
  })  : _lat = lat ?? 0.0,
        _lon = lon ?? 0.0,
        _cnt = cnt;

  @override
  Future<ICollectionWeather> getCollectionWeather() async {
    final _collectionWeather = CollectionWeather();
    final _fullCityJson = await _getJsonCity();
    final _fullWeatherJson = await _getJsonWeather();

    final List<dynamic> _listWeatherJsonForDay = _fullWeatherJson['daily'];
    final List<dynamic> _listWeatherJsonForHour = _fullWeatherJson['hourly'];
    String _locationName = _fullCityJson['list'].first['name'];

    /// Перебор полученых Джейсон-списков
    for (final weatherJson in _listWeatherJsonForDay) {
      _collectionWeather.setWeatherDay = _getWeatherForDay(weatherJson, _locationName);
    }
    for (final weatherJson in _listWeatherJsonForHour) {
      _collectionWeather.setWeatherHour = _getWeatherForHour(weatherJson, _locationName);
    }
    return _collectionWeather;
  }

  /// Получение объекта погоды на день
  WeatherForDay _getWeatherForDay(Map<String, dynamic> weatherJson, String _locationName) {
    return WeatherForDay.fromJson(weatherJson, _locationName);
  }

  /// Получение объекта погоды на час
  WeatherForHour _getWeatherForHour(Map<String, dynamic> weatherJson, String _locationName) {
    return WeatherForHour.fromJson(weatherJson, _locationName);
  }

  Future<Map<String, dynamic>> _getJsonWeather() async {
    Map<String, dynamic> _json;
    String url = 'https://api.openweathermap.org/data/2.5/onecall?lat=$_lat&lon=$_lon&appid=$kApiKey';
    final response = await http.get(url);
    if ((response.statusCode == 200)) {
      _json = json.decode(response.body);
    } else {
      print('Failed to load Weather jason\nStatusCode: ${response.statusCode}');
    }

    return _json;
  }

  Future<Map<String, dynamic>> _getJsonCity() async {
    Map<String, dynamic> _json;
    String url = 'https://api.openweathermap.org/data/2.5/find?lat=$_lat&lon=$_lon&cnt=$_cnt&appid=$kApiKey';
    final response = await http.get(url);
    if ((response.statusCode == 200)) {
      _json = json.decode(response.body);
    } else {
      print('Failed to load City jason\nStatusCode: ${response.statusCode}');
    }

    return _json;
  }
}
