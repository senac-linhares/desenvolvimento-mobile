Explore a anatomia fundamental de um app Flutter entendendo como widgets como MaterialApp, Center e Text funcionam juntos para exibir o conteúdo. Esta lição ajuda você a entender a hierarquia de widgets e a estrutura básica de aplicativos essenciais para desenvolver aplicativos Android com Flutter.

## Anatomia do aplicativo Hello Flutter[](https://www.educative.io/courses/beginning-flutter-android-mobile-app-development/flutter-app-anatomy#Anatomy-of-Hello-Flutter-app)

Nossa primeira versão do app consiste em uma tela de pai e texto no meio da tela. No Flutter, tudo é um widget. Isso significa que a tela onde o texto é renderizado é um widget, e o texto em si também é widget.

Nossa primeira versão do app consiste em uma tela de pai e texto no meio da tela.

Por favor, note o mapeamento de widgets do app com a árvore de widgets visual:

- `MaterialApp` Widget é o que você vê como uma tela preta.
    
- O texto "Hello Futter!" é centralizado usando o widget, que contém a sequência de texto real.`Center``Text`
    



Anatomia do aplicativo "Hello Flutter!"

## O que é um widget?[](https://www.educative.io/courses/beginning-flutter-android-mobile-app-development/flutter-app-anatomy#What-is-a-widget)

Um [widget Flutter](https://flutter.dev/docs/development/ui/widgets) é um objeto imutável que descreve uma parte específica de uma interface do usuário. Vamos focar em três tipos de widgets Flutter nesta lição:

### `MaterialApp` widget[](https://www.educative.io/courses/beginning-flutter-android-mobile-app-development/flutter-app-anatomy#MaterialApp-widget)

No nosso aplicativo Hello Flutter, o widget [`MaterialApp`](https://api.flutter.dev/flutter/material/MaterialApp-class.html) está na raiz do app.

Este é o widget central que fornece acesso a outros elementos úteis do Flutter necessários para construir um aplicativo.`MaterialApp`

### `Center` widget[](https://www.educative.io/courses/beginning-flutter-android-mobile-app-development/flutter-app-anatomy#Center-widget)

O [`widget central`](https://api.flutter.dev/flutter/widgets/Center-class.html) garante que qualquer um dos filhos fique no meio da tela.

### `Text` widget[](https://www.educative.io/courses/beginning-flutter-android-mobile-app-development/flutter-app-anatomy#Text-widget)

O widget [`de Texto`](https://flutter.dev/docs/development/ui/widgets/text) exibe o texto "Hello Flutter!" na tela.

![Mapeamento de widgets do app Hello Flutter com o visual da árvore de widgets](https://www.educative.io/api/collection/5726865580883968/6563776842170368/page/6385187697983488/image/6127428758929408?page_type=collection_lesson&collection_token=oAkzybG99j3lCS7DiVW188&get_optimised=true "Hello Flutter app's widget mapping with the widget tree visual")

Mapeamento de widgets do app Hello Flutter com o visual da árvore de widgets

Agora que você tem uma compreensão básica de como os apps Flutter são estruturados, vamos passar para a próxima lição para explorar as opções disponíveis para criar um projeto Futter.