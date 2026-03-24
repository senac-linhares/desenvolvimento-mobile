import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

enum ViewState { idle, busy, success, error }

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  
  WeatherModel? _weather;
  ViewState _state = ViewState.idle;
  String? _errorMessage;
  List<String> _history = [];
  bool _isDarkMode = false;

  WeatherModel? get weather => _weather;
  ViewState get state => _state;
  String? get errorMessage => _errorMessage;
  List<String> get history => _history;
  bool get isDarkMode => _isDarkMode;

  WeatherViewModel() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _history = prefs.getStringList('history') ?? [];
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  Future<void> fetchWeatherForCity(String city) async {
    _state = ViewState.busy;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(city);
      _updateHistory(_weather!.cityName);
      _state = ViewState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }

    notifyListeners();
  }

  /// Busca a localização do aparelho e depois a previsão
  Future<void> fetchWeatherForCurrentLocation() async {
    _state = ViewState.busy;
    notifyListeners();

    try {
      // 1. Verificar permissões do GPS
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Serviços de localização desativados no aparelho.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Permissão de localização negada.');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('As permissões de localização foram negadas permanentemente.');
      }

      // 2. Coletar a posição
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 3. Traduzir Lat/Lon para Cidade e Estado (ES)
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      String resolvedRegion = 'Desconhecido';
      
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // locality = Cidade, administrativeArea = Estado
        resolvedRegion = '\${place.locality}, \${place.administrativeArea}';
      }

      // 4. Buscar clima usando a nova localização
      _weather = await _weatherService.fetchWeatherByLocation(position.latitude, position.longitude, resolvedRegion);
      _updateHistory(_weather!.cityName);
      _state = ViewState.success;

    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }

    notifyListeners();
  }

  Future<void> _updateHistory(String cityName) async {
    if (!_history.contains(cityName)) {
      _history.insert(0, cityName);
      if (_history.length > 5) {
        _history.removeLast();
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('history', _history);
    }
  }

  /// LÓGICA DE NEGÓCIO - Recomendações esportivas de futebol
  String getFootballRecommendation() {
    if (_weather == null) return '';

    final temp = _weather!.temperature;
    final wind = _weather!.windSpeed; // Já recebemos em km/h do Open-Meteo
    final condition = _weather!.condition;

    // 1. Sol Forte (Acima de 32C ou Céu Limpo muito quente)
    if (temp > 32 || (condition == 'Céu limpo' && temp > 30)) {
      return "☀️ Sol intenso. Hidrate-se bem e evite jogar nos horários mais quentes (calor excessivo / risco de desidratação).";
    }

    // 2. Chuva (Chuva, Tempestade)
    if (condition.contains('Chuva') || condition.contains('Tempestade')) {
      return "🌧️ Chuva prevista. O campo pode ficar escorregadio, atrapalhando o jogo ou até causando cancelamento.";
    }

    // 3. Vento Forte (> 30 km/h)
    if (wind > 30) {
      return "💨 Vento forte ($wind km/h). Passes precisos e chutes longos podem ser afetados. Jogo por terra favorecido!";
    }

    // 4. Frio Intenso (< 18C)
    if (temp < 18) {
      return "❄️ Temperatura baixa. Faça um bom aquecimento extra antes de jogar para evitar lesões musculares.";
    }

    // 5. Clima Ideal
    return "✅ Clima favorável! Ótimo momento para um futebol sem preocupações climáticas severas.";
  }
}
