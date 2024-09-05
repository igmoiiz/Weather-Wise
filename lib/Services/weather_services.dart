// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Services/CONSTS/consts.dart';
import 'package:weather_app/Services/Models/weather_model.dart';

class WeatherServices {
  final String apiKey;
  WeatherServices({required this.apiKey});

  String? cityName;

  //  method to get weather
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await http
          .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to Load Weather Data");
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  //  method to get current city
  Future<String> getCurrentCityWeather() async {
    try {
      //  request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      //  fetch current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      //  convert location into list of place mark objects
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      //  extract city name from the first place mark
      cityName = placemarks[0].locality;
      return cityName ?? "Trouble getting your Location!";
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
