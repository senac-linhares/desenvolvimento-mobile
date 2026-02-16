# 👋 Hello Flutter: Seu Primeiro App

Chegou o momento de mergulharmos fundo no **Flutter**. Nas lições anteriores, você aprendeu a lógica do Dart. Agora, vamos usar essa lógica para construir interfaces que encantam o usuário.

<div class="hero-section" style="background: linear-gradient(135deg, #0ea5e9 0%, #2563eb 100%);">
    <h2>🎯 Criando Interfaces com Diversão</h2>
    <p>Nesta aula, vamos entender como o Flutter desenha as coisas na tela e por que o Hot Reload é o "superpoder" que vai te fazer um desenvolvedor 10x mais rápido.</p>
</div>

---

## 🏗️ O Código Mínimo

Para um app Flutter rodar, ele precisa de apenas um comando: `runApp()`. 

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Text("Hello Flutter!"),
      ),
    ),
  );
}
```

### O que aconteceu aqui?
- **MaterialApp**: É o widget que configura o estilo visual do seu app (Material Design).
- **Center**: É um widget que diz: "coloque o que estiver dentro de mim exatamente no meio da tela".
- **Text**: O widget que exibe palavras.

---

## ⚡ O Superpoder: Hot Reload

O Flutter é famoso por permitir que você veja suas mudanças **em menos de 1 segundo**.

1. Rode seu app no emulador (Aperte **F5**).
2. Mude o texto `"Hello Flutter!"` para `"Meu Primeiro App!"`.
3. Salve o arquivo (**Ctrl + S**).
4. **Mágica!** A tela atualiza sem você precisar esperar o app reiniciar.

<div class="callout tip">
    <div class="callout-title">💡 Dica do Mentor</div>
    Use o Hot Reload para testar cores, fontes e alinhamentos de forma rápida. Se algo mudar muito a estrutura do app e o Hot Reload não funcionar, use o <strong>Hot Restart</strong> (o ícone de raio verde com seta circular).
</div>

---

## 🎯 Desafio de Estética

<div class="challenge-box">
    <h3 style="margin-top: 0;">🎨 Mudando o Visual</h3>
    <p>Tente mudar o estilo do seu texto adicionando a propriedade <code>style</code> ao widget Text, como no exemplo abaixo:</p>
    <pre><code class="language-dart">Text(
  "Hello Flutter!",
  style: TextStyle(
    fontSize: 40,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  ),
)</code></pre>
</div>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #0ea5e9 0%, #2563eb 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Primeiro App Rodando!</h3>
    <p style="margin: 10px 0 0 0;">Agora que você sentiu o poder, vamos entender a diferença entre os dois principais tipos de componentes!</p>
</div>
