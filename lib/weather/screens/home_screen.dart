import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:test_pro_area/weather/settings/setting.dart';

import 'components/card_weather_day.dart';
import 'components/card_weather_hour.dart';

import '../cubit/models/model_collection_weather.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.collectionWeather}) : super(key: key);

  final ICollectionWeather collectionWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _listCardWeatherDay;
  List<Widget> _listCardWeatherHour;
  List<String> _choise = ['Day', 'Hour'];
  String currentChoise = 'Day';
  bool get _isDay => currentChoise == 'Day';
  @override
  void initState() {
    _listCardWeatherDay = [];
    _listCardWeatherHour = [];
    for (var weatherDay in widget.collectionWeather.listWeatherDay) {
      _listCardWeatherDay.add(CardWeatherDay(weather: weatherDay));
    }
    for (var weatherHour in widget.collectionWeather.listWeatherHour) {
      _listCardWeatherHour.add(CardWeatherHour(weather: weatherHour));
    }
    final hight = 200.0;
    _listCardWeatherDay.add(SizedBox(height: hight));
    _listCardWeatherHour.add(SizedBox(height: hight));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _controllButtons(),
        _weatherList(_isDay ? _listCardWeatherDay : _listCardWeatherHour),
      ],
    );
  }

  Container _controllButtons() {
    return Container(
      color: gCyanTheme.accentColor,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
      height: 90,
      child: cupertino.Stack(
        alignment: Alignment(-1, 0),
        children: [
          Container(
            padding: EdgeInsets.only(left: 50),
            alignment: Alignment(0, 0),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: gCyanTheme.cardColor,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Weather for: ${widget.collectionWeather.listWeatherDay.first.locationName}.',
                  style: gTextStyleLocation,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.where_to_vote_outlined),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: gCyanTheme.accentColor,
                      )),
                ),
              ],
            ),
          ),
          _coiseButton(),
        ],
      ),
    );
  }

  Expanded _weatherList(List<Widget> listCardWeather) {
    return Expanded(
      child: ListView.builder(
        itemCount: listCardWeather.length,
        itemBuilder: (BuildContext context, int index) {
          return listCardWeather[index];
        },
      ),
    );
  }

  Widget _coiseButton() {
    return Container(
      alignment: Alignment(-1, 0),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: cupertino.CupertinoPicker(
        itemExtent: 35,
        onSelectedItemChanged: (int ind) {
          setState(() {
            currentChoise = _choise[ind % _choise.length];
          });
        },
        children: _choise.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    );
  }
}
