class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;

  WeatherModel({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName:
          json['name'] ?? 'City Not Found', // Default value if 'name' is null
      temperature: (json['main']?['temp'])?.toDouble() ??
          0.0, // Convert to double & provide default
      mainCondition: json['weather']?[0]['main'] ??
          'Unknown', // Default value if 'weather' or 'main' is null
    );
  }
}
