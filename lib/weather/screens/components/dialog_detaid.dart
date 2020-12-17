import 'package:flutter/material.dart';
import 'package:test_pro_area/weather/cubit/models/model_weather.dart';

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
                  Icon(
                    Icons.access_time_outlined,
                    size: kSizeIconSmall,
                  )),
              infoBox(
                  'Direction wind: ${weather.deg}°',
                  Icon(
                    Icons.threesixty_outlined,
                    size: kSizeIconSmall,
                  )),
              infoBox(
                  'Wind speed: ${weather.speed} m/s',
                  Icon(
                    Icons.speed_outlined,
                    size: kSizeIconSmall,
                  )),
              infoBox(
                '''Temp: ${(weather.temperatureMin - 273.15).round()}°''',
                Icon(
                  Icons.ac_unit_outlined,
                  size: kSizeIconSmall,
                ),
              ),
              infoBox(
                'Feel Temperature: ${weather.feelsLike}°',
                Icon(
                  Icons.ac_unit_outlined,
                  size: kSizeIconSmall,
                ),
              ),
              infoBox(
                'Atmospheric pressure: ${weather.pressure} hPa',
                Icon(
                  Icons.description_outlined,
                  size: kSizeIconSmall,
                ),
              ),
              infoBox(
                'Humidity: ${weather.humidity}%',
                Icon(
                  Icons.description_outlined,
                  size: kSizeIconSmall,
                ),
              ),
              infoBox(
                'Cloudiness: ${weather.clouds}%',
                Icon(
                  Icons.description_outlined,
                  size: kSizeIconSmall,
                ),
              ),
              infoBox(
                '${weather.description}',
                Icon(
                  Icons.description_outlined,
                  size: kSizeIconSmall,
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
