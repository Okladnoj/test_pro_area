import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_pro_area/weather/settings/setting.dart';

import '../../cubit/models/model_weather.dart';

import 'dialog_detaid.dart';
import 'card_interface.dart';

class CardWeatherDay extends ICard {
  CardWeatherDay({IWeather weather}) : super(weather: weather);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showArlet(weather: weather, context: context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(7),
                  gradient: RadialGradient(
                    radius: 0.55,
                    colors: [gCyanTheme.primaryColorDark, gCyanTheme.cardColor],
                  ),
                ),
                width: constraints.maxHeight,
                height: constraints.maxHeight,
                child: Image.network(
                  weather.iconUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    infoBox(
                        'Date: ${weather.dateTime}',
                        Icon(
                          Icons.date_range_outlined,
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
                      '${weather.description}',
                      Icon(
                        Icons.description_outlined,
                        size: kSizeIconSmall,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    infoBox(
                      '''Max. temp:\n${(weather.temperatureMax - 273.15).round()}°''',
                      Icon(
                        Icons.wb_sunny_outlined,
                        size: kSizeIconSmall,
                      ),
                    ),
                    infoBox(
                      '''Min. temp:\n${(weather.temperatureMin - 273.15).round()}°''',
                      Icon(
                        Icons.ac_unit_outlined,
                        size: kSizeIconSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
