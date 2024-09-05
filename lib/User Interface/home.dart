import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Services/CONSTS/consts.dart';
import 'package:weather_app/Services/Models/weather_model.dart';
import 'package:weather_app/Services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  api key
  final weatherServices = WeatherServices(apiKey: APIKEY);
  WeatherModel? _weather;
  //  fetch weather
  _fetchWeather() async {
    //  get current city
    String cityName = await weatherServices.getCurrentCityWeather();
    //  get weather for city
    try {
      final weather = await weatherServices.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  //  weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'Assets/Sunny.json'; // default sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'Assets/Clouds.json';
      case 'clear':
        return 'Assets/Sunny.json';
      case 'thunderstorm':
        return 'Assets/Thunder.json';
      case 'drizzle':
        return 'Assets/Rain.json';
      case 'rain':
        return 'Assets/Rain.json';
      case 'snow':
        return 'Assets/Snow.json';
      case 'sleet':
        return 'Assets/Snow.json';
      case 'hail':
        return 'Assets/Snow.json';
      case 'fog':
        return 'Assets/Smoke.json';
      case 'mist':
        return 'Assets/Rain.json';
      case 'smoke':
        return 'Assets/Smoke.json';
      case 'dust':
        return 'Assets/Smoke.json';
      case 'hot':
        return 'Assets/Heatwave.json';
      case 'cold':
        return 'Assets/Snow.json';
      default:
        return 'Assets/Sunny.json';
    }
  }

  //  init state
  @override
  void initState() {
    super.initState();

    //  fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _weather?.cityName ?? 'Loading Please Wait...',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '${_weather?.temperature.round()}° C',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          _animationBuilder(),
          Text(
            _weather?.mainCondition ?? 'Loading Please Wait...',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _animationBuilder() {
    return Lottie.asset(getWeatherAnimation(
        _weather?.mainCondition ?? 'Loading Please Wait...'));
  }
}
