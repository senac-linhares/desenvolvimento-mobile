import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  // O Open-Meteo não exige API Key!
  static const String geocodingUrl = 'https://geocoding-api.open-meteo.com/v1/search';
  static const String weatherUrl = 'https://api.open-meteo.com/v1/forecast';

  /// Método responsável pela comunicação com as APIs gratuitas do Open-Meteo
  Future<WeatherModel> fetchWeather(String cityName) async {
    try {
      // 1. O Open-Meteo exige Latitude e Longitude, então usamos a API de Geocoding deles primeiro.
      final geoUri = Uri.parse('$geocodingUrl?name=$cityName&count=1&language=pt');
      final geoResponse = await http.get(geoUri);

      if (geoResponse.statusCode != 200) {
        throw Exception('Falha ao conectar no servidor de buscas.');
      }

      final geoData = json.decode(geoResponse.body);
      
      if (geoData['results'] == null || geoData['results'].isEmpty) {
        throw Exception('Cidade não encontrada.');
      }

      final cityData = geoData['results'][0];
      final double lat = cityData['latitude'];
      final double lon = cityData['longitude'];
      final String resolvedCityName = cityData['name'];

      // 2. Agora buscamos o clima utilizando a latitude e longitude encontradas
      // Configurado para retornar variáveis atuais e usar km/h para vento
      final weatherUri = Uri.parse(
        '$weatherUrl?latitude=$lat&longitude=$lon&current=temperature_2m,apparent_temperature,wind_speed_10m,weather_code&wind_speed_unit=kmh'
      );
      
      final weatherResponse = await http.get(weatherUri);

      if (weatherResponse.statusCode == 200) {
        final weatherData = json.decode(weatherResponse.body);
        final current = weatherData['current'];

        // Instanciamos nosso Model passando os dados e o nome resolvido da cidade
        return WeatherModel.fromOpenMeteo(resolvedCityName, current);
      } else {
        throw Exception('Falha ao carregar dados do clima.');
      }
    } catch (e) {
      throw Exception('Erro de comunicação. Detalhes: $e');
    }
  }

  /// Busca o clima usando Latitude e Longitude (usado pelo GPS)
  Future<WeatherModel> fetchWeatherByLocation(double lat, double lon, String resolvedCityName) async {
    try {
      final weatherUri = Uri.parse(
        '$weatherUrl?latitude=$lat&longitude=$lon&current=temperature_2m,apparent_temperature,wind_speed_10m,weather_code&wind_speed_unit=kmh'
      );
      
      final weatherResponse = await http.get(weatherUri);

      if (weatherResponse.statusCode == 200) {
        final weatherData = json.decode(weatherResponse.body);
        final current = weatherData['current'];
        return WeatherModel.fromOpenMeteo(resolvedCityName, current);
      } else {
        throw Exception('Falha ao carregar dados do clima pela localização.');
      }
    } catch (e) {
      throw Exception('Erro de comunicação. Detalhes: $e');
    }
  }
}
