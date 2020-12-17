import 'package:flutter/material.dart';

import 'weather/weather.dart';

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: gCyanTheme,
      home: BlocScreen(),
    );
  }
}
