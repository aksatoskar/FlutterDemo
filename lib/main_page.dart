import 'dart:collection';

import 'package:firstflutterapp/ApiCall/data/repository/api_service.dart';
import 'package:firstflutterapp/ApiCall/data/repository/network_comment_repository.dart';
import 'package:firstflutterapp/ApiCall/data/repository/network_weather_repository.dart';
import 'package:firstflutterapp/ApiCall/presentation/comment/bloc/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ApiCall/data/repository/app_repository.dart';
import 'ApiCall/data/repository/in_memory_weather_repository.dart';
import 'ApiCall/presentation/bloc/weather_bloc.dart';
import 'ApiCall/presentation/view/weather_page.dart';
import 'NetworkAdapter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {

  final networkAdapter = NetworkAdapter();


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppRepository(inMemoryWeatherRepository: InMemoryWeatherRepository(), networkWeatherRepository: NetworkWeatherRepository(apiService: ApiService()), networkCommentRepository: NetworkCommentRepository(apiService: ApiService())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(appRepository: context.read<AppRepository>()),
          ),
          BlocProvider(
            create: (context) => CommentCubit(appRepository: context.read<AppRepository>()), // Assuming your CommentCubit uses the networkCommentRepository
          )
        ],
        child: const Scaffold(
          body: WeatherPage(),
        ),
      ),
    );
  }
}


class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final lookup = HashMap<int,bool>();
    final List<int> result = [];

    for (final num in nums) {
      final potentialMatch = target - num;
      if (lookup.containsKey(potentialMatch)) {
        result.addAll([num, potentialMatch]);
        return result;
      } else {
        lookup[num] = true;
      }
    }
    return result;
  }
}