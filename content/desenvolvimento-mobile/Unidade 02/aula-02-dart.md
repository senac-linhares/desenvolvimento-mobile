# 🎯 Dart: Variáveis e Tipos

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
🎯 ⌨️ ⚡
</div>

O Dart é uma linguagem **fortemente tipada**, o que significa que ele te ajuda a não cometer erros bobos, como tentar somar um nome com um número. 

<div class="hero-section" style="background: linear-gradient(135deg, #0175c2 0%, #13b9fd 100%);">
    <h2>🚀 Rodando seu Primeiro Código</h2>
    <p>Nesta aula, não vamos apenas ler. Vamos ver como rodar lógica Dart dentro do emulador para ver os resultados aparecerem no console do VS Code!</p>
</div>

---

## 1️⃣ Variáveis e Tipos

No Dart, você pode declarar tipos de forma explícita ou deixar o Dart descobrir sozinho (inferência).

```dart
String nome = "Welton"; // Texto
int idade = 25;        // Inteiro
double altura = 1.75;  // Decimal
bool programador = true; // Booleano
```

---

## 2️⃣ Variáveis Dinâmicas

Às vezes você não sabe o que vai receber. Para isso existe o `dynamic` e o `var`.

- **var**: O tipo é definido na primeira vez que você atribui um valor e não muda mais.
- **dynamic**: O tipo pode mudar a qualquer momento (use com cuidado!).

---

## 🧪 Prática no Emulador

Para simular isso no seu computador, abra o arquivo `lib/main.dart` do seu projeto Flutter, apague tudo e cole o código abaixo. Depois, abra o **Debug Console** no VS Code para ver as mensagens!

```dart
import 'package:flutter/material.dart';

void main() {
  // --- NOSSA LÓGICA DART COMEÇA AQUI ---
  String professor = "Welton";
  int aulas = 10;
  double progresso = 0.5;
  
  print("Professor: $professor");
  print("Total de Aulas: $aulas");
  print("Progresso do curso: ${progresso * 100}%");
  // -------------------------------------

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Olhe o Debug Console do VS Code!"),
        ),
      ),
    ),
  );
}
```

<div class="callout tip">
    <div class="callout-title">💡 Dica do Mentor</div>
    O comando <code>print()</code> é seu melhor amigo para entender o que está acontecendo "por debaixo do capô" enquanto você aprende a lógica.
</div>

---

## 🎯 Desafio de Tipos

<div class="challenge-box">
    <h3 style="margin-top: 0;">🧠 Tente prever</h3>
    <p>O que acontece se você tentar rodar o código abaixo?</p>
    <pre><code class="language-dart">var valor = 10;
valor = "Dez";
print(valor);</code></pre>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>🔴 <strong>Erro de Compilação!</strong> Como você usou <code>var</code> e atribuiu <code>10</code>, o Dart definiu que essa variável é do tipo <code>int</code> para sempre. Tentar colocar um texto (String) nela depois causará um erro.</p>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #0175c2 0%, #13b9fd 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Tipos Dominados!</h3>
    <p style="margin: 10px 0 0 0;">Agora que você conhece os dados, vamos aprender a tomar decisões com eles!</p>
</div>
