import 'package:flutter/material.dart';
import 'package:test_pro_area/weather/cubit/models/model_weather.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../weather.dart';
import 'card_interface.dart';

Future<void> showArlet({
  @required IWeather weather,
  @required BuildContext context,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Details about the weather'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(7),
                  gradient: RadialGradient(
                    radius: 0.55,
                    colors: [gCyanTheme.primaryColorDark, gCyanTheme.cardColor],
                  ),
                ),
                child: Image.network(
                  weather.iconUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              infoBox(
                'Date - Time: ${weather.dateTime}',
                BoxedIcon(
                  TimeIcon.fromDate(DateTime.utc(weather.dateTimeUtc * 1000)),
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                'Direction wind: ${weather.deg}°',
                WindIcon(
                  degree: weather.deg,
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                'Wind speed: ${weather.speed} m/s',
                BoxedIcon(
                  WeatherIcons.fromString('wi-wind-beaufort-${weather.speed.round()}'),
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                '''Temp: ${(weather.temperatureMin - 273.15).round()}°''',
                BoxedIcon(
                  WeatherIcons.thermometer_internal,
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                'Feel Temperature: ${weather.feelsLike}°',
                BoxedIcon(
                  WeatherIcons.thermometer,
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                'Atmospheric pressure: ${weather.pressure} hPa',
                BoxedIcon(
                  WeatherIcons.barometer,
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                'Humidity: ${weather.humidity}%',
                BoxedIcon(
                  WeatherIcons.humidity,
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                'Cloudiness: ${weather.clouds}%',
                BoxedIcon(
                  WeatherIcons.cloudy,
                  size: kSizeIconLage,
                ),
              ),
              infoBox(
                '${weather.description}',
                Icon(
                  Icons.description_outlined,
                  size: kSizeIconLage,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
