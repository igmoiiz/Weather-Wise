class WeatherModel {
  final String cityName;
  final double temperature;
  final double minTemp;
  final double maxTemp;
  final String mainCondition;
  final int humidity;
  final double windSpeed;
  final double pressure; // Added pressure field

  WeatherModel({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] ?? 'City Not Found',
      temperature: (json['main']?['temp'])?.toDouble() ?? 0.0,
      minTemp: (json['main']?['temp_min'])?.toDouble() ?? 0.0,
      maxTemp: (json['main']?['temp_max'])?.toDouble() ?? 0.0,
      mainCondition: json['weather']?[0]['main'] ?? 'Unknown',
      humidity: json['main']?['humidity'] ?? 0,
      windSpeed: (json['wind']?['speed'])?.toDouble() ?? 0.0,
      pressure:
          (json['main']?['pressure'])?.toDouble() ?? 0.0, // Parse pressure
    );
  }
}
