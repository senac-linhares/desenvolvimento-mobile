# 📦 Design: Container e Padding

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
📦 🧧 🎨
</div>

Para finalizar esta unidade, vamos conhecer os dois widgets que dão o "acabamento" ao seu app. O **Container** é o canivete suíço de estilo, e o **Padding** é o que dá o "respiro" necessário para o design não sufocar.

<div class="hero-section" style="background: linear-gradient(135deg, #7c3aed 0%, #a855f7 100%);">
    <h2>🎯 Estilo e Acabamento</h2>
    <p>Aprenda a criar caixas com cores, bordas arredondadas e sombras. O design do seu app vai mudar de nível hoje.</p>
</div>

---

## 📦 O Widget Container

O `Container` permite que você defina:
- Cor de fundo (`color`).
- Tamanho fixo (`width` e `height`).
- Bordas e Sombras (`decoration`).
- Espaçamento interno (`padding`) e externo (`margin`).

## 🧧 O Widget Padding

Às vezes você só quer um espaçamento. Usar um `Container` só para isso é pesado. O `Padding` é um widget leve focado apenas em dar distância entre os componentes.

---

## 🧪 Prática no Emulador

Vamos criar um card estilizado usando um **Container** com decoração!

```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: DesignPage()));

class DesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Design com Container")),
      body: Center(
        child: Container(
          // Estilo da Caixa
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Premium Card", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Este é um exemplo de como o Container transforma o visual do seu app!"),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 🎯 Desafio de Design

<div class="challenge-box">
    <h3 style="margin-top: 0;">🤔 Diferença Crucial</h3>
    <p>Qual é a diferença visual entre <code>padding</code> e <code>margin</code> dentro de um Container?</p>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>✅ <strong>Padding</strong> é o espaço <strong>dentro</strong> da borda (entre a borda e o texto). <strong>Margin</strong> é o espaço <strong>fora</strong> da borda (afastando o Container de outros elementos).</p>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #7c3aed 0%, #a855f7 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Unidade 03 Completa!</h3>
    <p style="margin: 10px 0 0 0;">Agora você tem o poder de criar interfaces bonitas e estruturadas. Continue praticando!</p>
</div>
