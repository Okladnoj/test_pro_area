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
  List<String> _choise = ['Weather for 8 days', 'Weather for 48 hours (2 days)'];
  String currentChoise = 'Weather for 8 days';
  bool get _isDay => currentChoise == 'Weather for 8 days';
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
      child: Container(
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
    );
  }

  Widget _weatherList(List<Widget> listCardWeather) {
    return Expanded(
      child: Stack(
        alignment: Alignment(0, 1),
        children: [
          ListView.builder(
            itemCount: listCardWeather.length,
            itemBuilder: (BuildContext context, int index) {
              return listCardWeather[index];
            },
          ),
          _coiseButton(),
        ],
      ),
    );
  }

  Widget _coiseButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 80,
      alignment: Alignment(-1, 0),
      padding: EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Color(0x98495F5E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5),
      ),
      child: cupertino.CupertinoPicker(
        offAxisFraction: -0.5,
        itemExtent: 40,
        onSelectedItemChanged: (int ind) {
          setState(() {
            currentChoise = _choise[ind % _choise.length];
          });
        },
        children: _choise.map((location) {
          return DropdownMenuItem(
            child: Center(child: new Text(location)),
            value: location,
          );
        }).toList(),
      ),
    );
  }
}
