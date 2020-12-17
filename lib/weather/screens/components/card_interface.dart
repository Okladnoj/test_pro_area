import 'package:flutter/material.dart';

import '../../cubit/models/model_weather.dart';
import '../../weather.dart';

abstract class ICard extends StatelessWidget {
  final IWeather weather;

  const ICard({
    Key key,
    this.weather,
  }) : super(key: key);
  Widget build(BuildContext context);
}

Widget infoBox(String text, [Icon icon]) => Container(
      margin: EdgeInsets.only(left: 5, top: 1, bottom: 1),
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: gCyanTheme.focusColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon ?? Container(),
          SizedBox(
            width: 2,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
