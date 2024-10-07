
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WeatherState();
  }
}

class _WeatherState extends State<WeatherPage> {
  late final WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = context.read<WeatherBloc>();
    _weatherBloc.add(const LoadWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WeatherApp',
          style: TextStyle(color: Theme
              .of(context)
              .primaryColorDark),
        ),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state.error != null && state.error.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('failed to fetch weather')));
          }
        },
        builder: (context, state) {
          final temp = state.weather.temperature;
          final windSpeed = state.weather.windSpeed;
          return Container(
            child: (
                Column(
                  children: [
                    Text('Weather temp is $temp and windspeed is $windSpeed'),
                    if (state.isLoading)
                      const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}
