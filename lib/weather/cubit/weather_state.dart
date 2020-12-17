part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  ICollectionWeather get collectionWeather;
  bool get isSplash;
}

class WeatherInitial extends WeatherState {
  final ICollectionWeather _collectionWeather;
  final bool _isSplash;

  WeatherInitial({ICollectionWeather collectionWeather})
      : _collectionWeather = collectionWeather,
        _isSplash = true;
  WeatherInitial.getSplash({
    @required ICollectionWeather collectionWeather,
    @required bool isSplash,
  })  : _collectionWeather = collectionWeather,
        _isSplash = isSplash;
  @override
  get collectionWeather => _collectionWeather;

  @override
  bool get isSplash => _isSplash;
}
