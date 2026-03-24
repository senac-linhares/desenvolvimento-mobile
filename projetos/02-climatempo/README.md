# Climatempo Futebol - Curso Flutter

Este é um projeto didático em Flutter construído com a arquitetura **MVVM (Model-View-ViewModel)**. Seu objetivo é ajudar estudantes iniciantes a compreenderem conceitos de gerenciamento de estado avançado (utilizando `provider`), requisições de API (usando `http`) e como estruturar o código separando responsabilidade visual e lógica de negócios.

## Objetivo
O aplicativo consome dados da API gratuita do **Open-Meteo** (sem necessidade de API Key), mostra a temperatura e as condições atuais de uma cidade e oferece uma dica baseada nas condições meteorológicas voltada para a prática de futebol.

## Como Executar
1. Certifique-se de que possui o Flutter instalado (`flutter --version`).
2. Execute o comando `flutter pub get` no terminal, dentro da pasta do projeto, para que os pacotes (`provider`, `http`, `shared_preferences`, etc) sejam baixados.
3. Inicie com `flutter run` ou abra no Visual Studio Code / Android Studio e dê "Start Debugging".
*(Nenhuma API Key é necessária para rodar este projeto, graças ao uso exclusivo da Open-Meteo!)*

## Estrutura de Pastas e MVVM
- **Model** (`lib/models/weather_model.dart`): Estrutura a forma em que os JSONs da API serão recebidos e instanciados em objetos Dart. Lida estritamente com dados e traduz Códigos WMO em Ícones Nativos.
- **Service** (`lib/services/weather_service.dart`): Onde fica a comunicação com a API. Abstrai a parte puramente técnica do `http.get()` acessando a API de Geocoding e depois a de Clima.
- **ViewModel** (`lib/viewmodels/weather_viewmodel.dart`): Responsável pela lógica da aplicação, como fazer o histórico e ditar as "Regras do Futebol". Tudo que interage com a tela indiretamente (State Management puro) via *Provider* passa por aqui.
- **View / Widgets** (`lib/views/`): Onde ficam as telas. Escutam passivamente as mudanças de variáveis lá da *ViewModel* mas não processam dado! Apenas exibem.

## Sugestões de Melhorias Futuras (Desafios Práticos)
- **Localização (GPS)**: Utilizar o pacote `geolocator` para que, ao abrir o App, ele tente pegar automaticamente o clima da localização atual sem precisar digitar.
- **Lista Expansível**: Se a cidade não for encontrada, interagir com a API de preenchimento (Autocomplete) que ajude a evitar erros de digitação do usuário.
- **Animações Lottie**: Atualmente importado no `pubspec.yaml`, tente incluir no widget de Splash ou no clima principal interagindo com os dados de condição climática.
- **Tratamento de Exceções refinado**: Mostrar botões de "Tentar Novamente" na interface em caso de falha de conexão com a Open-Meteo.
