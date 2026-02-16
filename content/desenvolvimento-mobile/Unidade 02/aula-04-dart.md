# 📦 Dart: Coleções

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
📚 🗺️ 🔗
</div>

Quase tudo em um aplicativo moderno é uma **coleção**. Uma lista de seguidores, um mapa de endereços, uma galeria de fotos. No Dart, as coleções são extremamente poderosas e flexíveis.

<div class="hero-section" style="background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);">
    <h2>🎯 Organizando a Bagunça</h2>
    <p>Aprenda a guardar múltiplos itens de forma organizada. Vamos usar listas e mapas para carregar conteúdos dinâmicos no seu app.</p>
</div>

---

## 1️⃣ Listas (Arrays)

A forma mais comum de guardar dados em sequência.

```dart
List<String> frutas = ["Banana", "Maçã", "Uva"];
frutas.add("Morango"); // Adiciona no fim
print(frutas[0]);      // Acessa o primeiro item (Índice 0)
```

---

## 2️⃣ Mapas (Dicionários)

Funcionam com o conceito de **Chave e Valor**. Muito parecido com o formato JSON.

```dart
Map<String, dynamic> usuario = {
  "nome": "Professor Welton",
  "idade": 30,
  "ativo": true
};

print(usuario["nome"]); // Professor Welton
```

---

## 🧪 Prática no Emulador

Vamos usar uma Lista de Strings para gerar uma lista visual no seu emulador!

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ListPage()));
}

class ListPage extends StatelessWidget {
  final List<String> tecnologias = ["Flutter", "Dart", "Firebase", "API Rest", "Git"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minhas Tecnologias")),
      body: ListView.builder(
        itemCount: tecnologias.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text(tecnologias[index]),
            subtitle: Text("Habilidade #${index + 1}"),
          );
        },
      ),
    );
  }
}
```

<div class="callout info">
    <div class="callout-title">ℹ️ O que é esse ListView?</div>
    O <code>ListView.builder</code> é um widget do Flutter que pega uma lista do Dart e a transforma em uma lista rolável na tela do celular de forma muito eficiente!
</div>

---

## 🎯 Desafio de Coleção

<div class="challenge-box">
    <h3 style="margin-top: 0;">🛠️ Manipulando Dados</h3>
    <p>Como você removeria o "Dart" da nossa lista de tecnologias usando código?</p>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>✅ Basta usar o método <code>remove</code>:</p>
        <pre><code class="language-dart">tecnologias.remove("Dart");</code></pre>
        <p>Ou pelo índice se você souber onde ele está:</p>
        <pre><code class="language-dart">tecnologias.removeAt(1);</code></pre>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Mestre das Listas!</h3>
    <p style="margin: 10px 0 0 0;">Agora você já sabe como organizar os dados do seu app!</p>
</div>
