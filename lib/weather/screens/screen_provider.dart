import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro_area/weather/cubit/weather_cubit.dart';

import 'custom_splash.dart';
import 'home_screen.dart';
import 'screen_waiter.dart';

class BlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(),
        ),
      ],
      child: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, weatherState) {
        if (weatherState.isSplash) {
          return CustomSplash();
        } else if (weatherState?.collectionWeather?.isRedy ?? false) {
          return Scaffold(
            body: HomeScreen(
              collectionWeather: weatherState?.collectionWeather,
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                context.read<WeatherCubit>().getWeather();
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        } else {
          return ScreenWaiter();
        }
      }),
    );
  }
}
