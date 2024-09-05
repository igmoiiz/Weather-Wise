import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Services/CONSTS/consts.dart';
import 'package:weather_app/Services/Models/weather_model.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/User%20Interface/about_page.dart';

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
    if (mainCondition == null) {
      return 'Assets/Loading Animation.json'; // default sunny
    }

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
        return 'Assets/Loading Animation.json';
    }
  }

  //  instance for weather services

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
      //  app bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const AboutPage()));
              },
              child: Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      //  body
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            _weather?.cityName ?? 'Loading Please Wait...',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Text(
            '${_weather?.temperature.round()}° C',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          _animationBuilder(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          _extraInformation(),
        ],
      ),
    );
  }

  Widget _animationBuilder() {
    return Lottie.asset(getWeatherAnimation(
        _weather?.mainCondition ?? 'Loading Please Wait...'));
  }

  //  maximum Temperature block
  Widget _maxTemp() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'Max Temp: ${_weather?.maxTemp.toStringAsFixed(0)}° C',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  //  minimum temperature block
  Widget _minTemp() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'Min Temp: ${_weather?.minTemp.toStringAsFixed(0)}° C',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  //  humidity index
  Widget _humidityIndex() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.075,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'Humidity: ${_weather?.humidity.toStringAsFixed(0)}%',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  //  wind speed index
  Widget _windSpeedIndex() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'Wind Speed: ${_weather?.windSpeed.toStringAsFixed(0)}m/s',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  //  main Condition
  Widget _mainCondition() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.13,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            _weather?.mainCondition ?? 'Loading Please Wait...',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  //  pressure index
  Widget _pressureIndex() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'Pressure: ${_weather?.pressure.toStringAsFixed(0)}m/s',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  //  displaying extra information
  Widget _extraInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.31,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _mainCondition(),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                _pressureIndex(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _minTemp(),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                _maxTemp(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _windSpeedIndex(),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                _humidityIndex(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
