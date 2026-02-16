# 🔄 Dart: Fluxo e Controle

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
⚖️ 🔁 🛣️
</div>

Um aplicativo não é apenas uma sequência de dados; ele precisa tomar **decisões**. "O usuário está logado?", "A senha está correta?", "Existem itens no carrinho?". Para isso, usamos as estruturas de controle.

<div class="hero-section" style="background: linear-gradient(135deg, #8b5cf6 0%, #6366f1 100%);">
    <h2>🎯 Inteligência no seu Código</h2>
    <p>Vamos aprender a usar IF, ELSE e Loops. Essas são as ferramentas que permitem que seu app reaja ao que o usuário faz.</p>
</div>

---

## 1️⃣ Tomando Decisões (If/Else)

A estrutura básica de decisão:

```dart
int nota = 8;

if (nota >= 7) {
  print("Aprovado! 🎉");
} else if (nota >= 5) {
  print("Recuperação. 😐");
} else {
  print("Reprovado. ❌");
}
```

---

## 2️⃣ Repetições (Loops)

Imagine que você quer exibir uma lista de 10 produtos. Você não vai escrever o código 10 vezes; você usará um loop!

```dart
// For tradicional
for (int i = 1; i <= 5; i++) {
  print("Contagem: $i");
}

// While (Enquanto a condição for verdadeira)
int bateria = 100;
while (bateria > 0) {
  print("App rodando... Bateria em $bateria%");
  bateria -= 10;
}
```

---

## 🧪 Prática no Emulador

Cole este código no seu `main.dart` para ver a lógica de decisão funcionando na tela do seu emulador!

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(ControlFlowApp());
}

class ControlFlowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lógica rápida para decidir a mensagem
    int hora = 14;
    String saudacao = "";

    if (hora < 12) {
      saudacao = "Bom dia! ☀️";
    } else if (hora < 18) {
      saudacao = "Boa tarde! ☕";
    } else {
      saudacao = "Boa noite! 🌙";
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Teste de Lógica")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(saudacao, style: TextStyle(fontSize: 40)),
              SizedBox(height: 20),
              Text("Hora atual simunada: $hora:00"),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 🎯 Desafio de Lógica

<div class="challenge-box">
    <h3 style="margin-top: 0;">🧠 O Loop Infinito</h3>
    <p>O que aconteceria se no exemplo do <code>while (bateria > 0)</code> nós esquecêssemos de colocar a linha <code>bateria -= 10;</code>?</p>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>🔴 <strong>Seu aplicativo travaria!</strong> Ele ficaria preso em um loop infinito, pois a bateria nunca chegaria a zero. Isso faria o processador do celular trabalhar ao máximo e o app pararia de responder.</p>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #8b5cf6 0%, #6366f1 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Lógica Destravada!</h3>
    <p style="margin: 10px 0 0 0;">Agora você sabe como fazer seu app "pensar". Vamos aprender a organizar grupos de dados!</p>
</div>
