import 'package:intl/intl.dart';

abstract class IWeather {
  final String dateTime;
  final double temperatureMax;
  final double temperatureMin;
  final String locationName;
  final String iconUrl;
  final double speed;
  final int deg;
  final String description;
  final String feelsLike;
  final String pressure;
  final String humidity;
  final String clouds;
  IWeather({
    this.dateTime,
    this.temperatureMax,
    this.temperatureMin,
    this.locationName,
    this.iconUrl,
    this.speed,
    this.deg,
    this.description,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.clouds,
  });
}

class WeatherForDay implements IWeather {
  final String dateTime;
  final double temperatureMax;
  final double temperatureMin;
  final String locationName;
  final String iconUrl;
  final double speed;
  final int deg;
  final String description;
  final String feelsLike;
  final String pressure;
  final String humidity;
  final String clouds;

  const WeatherForDay({
    this.dateTime,
    this.temperatureMax,
    this.temperatureMin,
    this.locationName,
    this.iconUrl,
    this.speed,
    this.description,
    this.deg,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.clouds,
  });

  WeatherForDay.fromJson(Map<String, dynamic> json, String locationName)
      : dateTime = _getTimeDay(json['dt'].toString().toInt),
        temperatureMax = json['temp']['max'].toString().toDou,
        temperatureMin = json['temp']['min'].toString().toDou,
        locationName = locationName,
        iconUrl = _generateIconUrl(json['weather'][0]['icon']),
        speed = json['wind_speed'].toString().toDou,
        deg = json['wind_deg'].toString().toInt,
        description = json['weather'][0]['description'],
        feelsLike = json['feels_like']['eve'].toString(),
        pressure = json['pressure'].toString(),
        humidity = json['humidity'].toString(),
        clouds = json['clouds'].toString();
}

class WeatherForHour implements IWeather {
  final String dateTime;
  final double temperatureMax;
  final double temperatureMin;
  final String locationName;
  final String iconUrl;
  final double speed;
  final int deg;
  final String description;
  final String feelsLike;
  final String pressure;
  final String humidity;
  final String clouds;

  const WeatherForHour({
    this.dateTime,
    this.temperatureMax,
    this.temperatureMin,
    this.locationName,
    this.iconUrl,
    this.speed,
    this.description,
    this.deg,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.clouds,
  });

  WeatherForHour.fromJson(Map<String, dynamic> json, String locationName)
      : dateTime = _getTimeHour(json['dt'].toString().toInt),
        temperatureMax = json['temp'].toString().toDou,
        temperatureMin = json['temp'].toString().toDou,
        locationName = locationName,
        iconUrl = _generateIconUrl(json['weather'][0]['icon']),
        speed = json['wind_speed'].toString().toDou,
        deg = json['wind_deg'].toString().toInt,
        description = json['weather'][0]['description'],
        feelsLike = json['feels_like'].toString(),
        pressure = json['pressure'].toString(),
        humidity = json['humidity'].toString(),
        clouds = json['clouds'].toString();
}

String _generateIconUrl(String icon) {
  return 'https://openweathermap.org/img/wn/$icon@2x.png';
}

String _getTimeHour(int millisecondsSinceEpoch) {
  return DateFormat('yy:MM:dd - HH:mm a').format(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch * 1000));
}

String _getTimeDay(int millisecondsSinceEpoch) {
  return DateFormat('yyyy:MM:dd').format(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch * 1000));
}

extension ExtensionString on String {
  double get toDou => double.tryParse(this) ?? 0.0;
  int get toInt => int.tryParse(this) ?? 0;
}
