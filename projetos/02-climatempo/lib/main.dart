import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/weather_viewmodel.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(
    // Injeção de dependência na raiz do projeto (Padrão MVVM)
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherViewModel()),
      ],
      child: const ClimatempoApp(),
    ),
  );
}

class ClimatempoApp extends StatelessWidget {
  const ClimatempoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Escutamos ativamente os temas na WeatherViewModel
    return Consumer<WeatherViewModel>(
      builder: (context, weatherVM, child) {
        return MaterialApp(
          title: 'Climatempo Futebol',
          debugShowCheckedModeBanner: false,
          theme: weatherVM.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
