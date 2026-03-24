import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final double windSpeed;
  final String condition;
  final IconData icon;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.windSpeed,
    required this.condition,
    required this.icon,
  });

  /// Factory para criar o modelo com dados do Open-Meteo
  factory WeatherModel.fromOpenMeteo(String city, Map<String, dynamic> current) {
    int code = current['weather_code'] ?? 0;
    
    // Mapeamento WMO (World Meteorological Organization)
    String mappedCondition = 'Desconhecido';
    IconData mappedIcon = Icons.cloud;

    if (code == 0) {
      mappedCondition = 'Céu limpo';
      mappedIcon = Icons.wb_sunny;
    } else if (code == 1 || code == 2 || code == 3) {
      mappedCondition = 'Parcialmente Nublado / Nublado';
      mappedIcon = Icons.cloud_queue;
    } else if (code == 45 || code == 48) {
      mappedCondition = 'Névoa';
      mappedIcon = Icons.foggy;
    } else if (code >= 51 && code <= 67) {
      mappedCondition = 'Chuva / Chuvisco';
      mappedIcon = Icons.grain;
    } else if (code >= 71 && code <= 77) {
      mappedCondition = 'Neve';
      mappedIcon = Icons.ac_unit;
    } else if (code >= 80 && code <= 82) {
      mappedCondition = 'Pancadas de Chuva';
      mappedIcon = Icons.water_drop;
    } else if (code >= 95 && code <= 99) {
      mappedCondition = 'Tempestade';
      mappedIcon = Icons.flash_on;
    }

    return WeatherModel(
      cityName: city,
      temperature: (current['temperature_2m'] ?? 0).toDouble(),
      feelsLike: (current['apparent_temperature'] ?? 0).toDouble(),
      windSpeed: (current['wind_speed_10m'] ?? 0).toDouble(), // O Open-Meteo já pode retornar em km/h
      condition: mappedCondition,
      icon: mappedIcon,
    );
  }
}
