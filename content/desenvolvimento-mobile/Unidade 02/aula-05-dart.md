# 🏛️ Dart: Orientação a Objetos

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
🏛️ 🧬 🧱
</div>

No Flutter, o ditado é: **"Tudo é um Widget"**. E no Dart, **"Tudo é uma Classe"**. Entender Orientação a Objetos (POO) é o que separa quem apenas "copia e cola" de quem realmente sabe criar aplicativos de larga escala.

<div class="hero-section" style="background: linear-gradient(135deg, #ec4899 0%, #db2777 100%);">
    <h2>🎯 Criando seus Próprios Tipos</h2>
    <p>Vamos aprender a criar Classes, que funcionam como moldes para criar objetos. Isso vai nos permitir criar nossos próprios Widgets no futuro!</p>
</div>

---

## 1️⃣ Classes e Objetos

Imagine uma classe `Celular`. Ela tem características (atributos) e ações (métodos).

```dart
class Celular {
  String marca;
  String modelo;
  int bateria;

  // Construtor (como criamos um celular novo)
  Celular(this.marca, this.modelo, this.bateria);

  void ligar() {
    print("O $modelo está ligando...");
  }
}
```

---

## 🧪 Prática no Emulador

Vamos criar uma classe `Estudante` e exibir os dados desse objeto na tela do app!

```dart
import 'package:flutter/material.dart';

// 1. Criamos o nosso Molde (Classe)
class Estudante {
  String nome;
  double progresso;
  
  Estudante(this.nome, this.progresso);
}

void main() {
  // 2. Criamos o nosso Objeto real
  Estudante aluno1 = Estudante("Seu Nome Aqui", 0.75);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Perfil do Aluno")),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 80, color: Colors.blue),
                Text(aluno1.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Progresso no curso: ${aluno1.progresso * 100}%"),
                LinearProgressIndicator(value: aluno1.progresso),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}
```

---

## 🎯 Desafio de Arquitetura

<div class="challenge-box">
    <h3 style="margin-top: 0;">🛠️ O Atributo Faltante</h3>
    <p>Se você quisesse adicionar uma foto ao perfil do estudante, o que você precisaria mudar na Classe <code>Estudante</code>?</p>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>✅ Você precisaria adicionar um novo atributo (campo) na classe:</p>
        <pre><code class="language-dart">class Estudante {
  String nome;
  double progresso;
  String urlFoto; // Nova propriedade!
  
  Estudante(this.nome, this.progresso, this.urlFoto);
}</code></pre>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #ec4899 0%, #db2777 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Mestre da Lógica e Objetos!</h3>
    <p style="margin: 10px 0 0 0;">Agora você tem toda a base de Dart necessária. Na Unidade 03, vamos focar 100% em construir telas poderosas com Flutter!</p>
</div>
