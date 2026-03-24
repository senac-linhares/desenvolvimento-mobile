import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import 'widgets/weather_card.dart';
import 'widgets/recommendation_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _cityController = TextEditingController();

  void _searchWeather() {
    final city = _cityController.text.trim();
    if (city.isNotEmpty) {
      // Usamos 'read' porque estamos fora da estrutura de 'build'
      context.read<WeatherViewModel>().fetchWeatherForCity(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Escutando as mudanças de estado da ViewModel
    final weatherVM = context.watch<WeatherViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Futebol'),
        actions: [
          IconButton(
            icon: Icon(weatherVM.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => weatherVM.toggleTheme(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de Busca
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
                border: const OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.my_location, color: Colors.blue),
                      onPressed: () {
                        context.read<WeatherViewModel>().fetchWeatherForCurrentLocation();
                        _cityController.clear();
                      },
                      tooltip: 'Usar localização atual',
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: _searchWeather,
                    ),
                  ],
                ),
              ),
              onSubmitted: (_) => _searchWeather(),
            ),
            const SizedBox(height: 20),
            
            // Tratamento das diferentes condições de tela
            Expanded(
              child: _buildBodyContent(weatherVM),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para evitar aninhamento excessivo no build
  Widget _buildBodyContent(WeatherViewModel vm) {
    switch (vm.state) {
      case ViewState.idle:
        return _buildIdleState(vm);
      case ViewState.busy:
        return const Center(child: CircularProgressIndicator());
      case ViewState.error:
        return Center(
          child: Text(
            vm.errorMessage ?? 'Ocorreu um erro.',
            style: const TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        );
      case ViewState.success:
        return ListView(
          children: [
            WeatherCard(weather: vm.weather!),
            const SizedBox(height: 20),
            RecommendationCard(recommendation: vm.getFootballRecommendation()),
          ],
        );
    }
  }

  // Helper para estado ocioso mostrando o histórico
  Widget _buildIdleState(WeatherViewModel vm) {
    if (vm.history.isEmpty) {
      return const Center(child: Text('Pesquise uma cidade para começar!'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Buscas Recentes:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: vm.history.length,
            itemBuilder: (context, index) {
              final city = vm.history[index];
              return ListTile(
                leading: const Icon(Icons.history),
                title: Text(city),
                onTap: () {
                  _cityController.text = city;
                  _searchWeather();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
