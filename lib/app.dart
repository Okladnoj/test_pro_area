import 'package:flutter/material.dart';

import 'weather/wether.dart';

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: gCyanTheme,
      home: HomeScreen(title: 'Home'),
    );
  }
}
