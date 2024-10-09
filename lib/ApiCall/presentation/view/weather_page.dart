
import 'package:firstflutterapp/ApiCall/presentation/comment/bloc/comment_cubit.dart';
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
  late final CommentCubit _commentCubit;

  @override
  void initState() {
    super.initState();
    _weatherBloc = context.read<WeatherBloc>();
    _commentCubit = context.read<CommentCubit>();
    _weatherBloc.add(const LoadWeather());
    _commentCubit.fetchComments();
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
      body: Column(
        children: [
          BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state.error != null && state.error.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('failed to fetch weather')));
              }
            },
            builder: (context, state) {
              final temp = state.weather.temperature;
              final windSpeed = state.weather.windSpeed;
              final desc = (state.weather.weatherConditionList.isNotEmpty)
                  ? state.weather.weatherConditionList[0].description
                  : '';
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: (
                    Column(
                      children: [
                        Text('Weather temp is $temp and windspeed is $windSpeed and it is a $desc'),
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

          BlocBuilder<CommentCubit, CommentState> (
            builder: (context, state) {
              if (state is CommentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CommentLoaded) {
                return Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    final comment = state.comments[index];
                    return ListTile(
                      title: Text(comment.email),
                      subtitle: Text(comment.body),
                    );
                  }),
                );
              } else if (state is CommentError) {
                return Center(child: Text('error is ${state.message}'));
              }
              return const Center(child: Text('No comments found.'));
            },
          )
        ],
      ),
    );
  }
}
