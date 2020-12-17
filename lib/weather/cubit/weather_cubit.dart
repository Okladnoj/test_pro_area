import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

import 'models/model_collection_weather.dart';
import 'providers/location_provider.dart';
import 'providers/weather_provider.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  ICollectionWeather _collectionWeather;
  bool _isSplash;

  WeatherCubit() : super(WeatherInitial()) {
    _isSplash = true;
    _portraitModeOnly();
    getWeather();
    startSplash();
  }

  getWeather() async {
    Position position = await determinePosition();
    _collectionWeather = await CarrentWeather(
      lat: position?.latitude,
      lon: position?.longitude,
    ).getCollectionWeather();

    emit(WeatherInitial.getSplash(collectionWeather: _collectionWeather, isSplash: _isSplash));
  }

  startSplash() async {
    await Future.delayed(Duration(seconds: 3));
    _isSplash = false;
    emit(WeatherInitial.getSplash(collectionWeather: _collectionWeather, isSplash: _isSplash));
  }

  @override
  Future<void> close() {
    _enableRotation();
    return super.close();
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
