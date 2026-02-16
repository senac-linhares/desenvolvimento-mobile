# 🎯 Introdução ao Dart

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
🎯 ⌨️ ⚡
</div>

Antes de começarmos a construir interfaces incríveis no Flutter, precisamos dominar a "linguagem por trás da tela": o **Dart**. 

O Dart é uma linguagem moderna, otimizada para interfaces de usuário e com uma curva de aprendizado muito amigável para quem já conhece C, Java ou JavaScript.

<div class="hero-section" style="background: linear-gradient(135deg, #0175c2 0%, #13b9fd 100%);">
    <h2>🚀 A Base do Seu Sucesso</h2>
    <p>O Dart é o que dá vida aos seus aplicativos. Nesta aula, vamos cobrir o coração da linguagem: variáveis, tipos de dados e como o Dart lida com segurança de código.</p>
</div>

---

## 1️⃣ Variáveis e Tipos (O Básico)

No Dart, tudo é um objeto. Isso significa que até os números têm métodos!

```dart
// Inferência de tipos (o Dart descobre o tipo sozinho)
var nome = "Welton"; 
var idade = 25;

// Declaração explícita
String cargo = "Desenvolvedor";
int nivel = 10;
double salario = 4500.50;
bool estaLogado = true;
```

<div class="callout tip">
    <div class="callout-title">💡 Dica do Mentor</div>
    Prefira usar <code>var</code> para variáveis locais e tipos explícitos para propriedades de classes ou parâmetros de funções importantes. Isso deixa seu código limpo e seguro!
</div>

---

## 2️⃣ Variáveis Imutáveis (Final e Const)

Segurança é tudo. No Dart, você vai usar muito variáveis que não mudam de valor:

- **final**: O valor é definido apenas uma vez (no momento em que o código roda).
- **const**: O valor é definido em tempo de compilação (antes mesmo do app rodar).

```dart
final horarioAcesso = DateTime.now(); // Definido ao rodar
const versaoApp = "1.0.2"; // Definido fixo no código
```

---

## 3️⃣ Null Safety (O Grande Diferencial)

O Dart moderno usa **Sound Null Safety**. Isso significa que as variáveis não podem ser nulas, a menos que você explicitamente permita.

```dart
String nome = "Welton"; // Nunca pode ser nula
String? apelido; // O '?' permite que seja nula

print(apelido?.length); // O '.' só é chamado se apelido não for nulo
```

<div class="callout warning">
    <div class="callout-title">⚠️ O Erro do Bilhão de Dólares</div>
    Essa funcionalidade do Dart evita que seu app feche sozinho (crash) tentando ler algo que não existe. É um dos maiores motivos pela estabilidade do Flutter!
</div>

---

## 4️⃣ Funções: As Ações do App

As funções no Dart são de "primeira classe", o que significa que podem ser passadas como parâmetros ou salvas em variáveis.

```dart
// Função Tradicional
void saudar(String nome) {
  print("Olá, $nome!");
}

// Arrow Function (Função de uma linha)
int somar(int a, int b) => a + b;

// Chamando
saudar("Aluno");
var resultado = somar(10, 5);
```

---

## 🎯 Desafio Prático

<div class="challenge-box">
    <h3 style="margin-top: 0;">💻 Hora do Código</h3>
    <p>Tente prever o que acontecerá no código abaixo e por que:</p>
    <pre><code class="language-dart">void main() {
  String? usuario;
  print(usuario.length);
}</code></pre>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Explicação</strong></summary>
    <div class="solution-content">
        <p>🔴 <strong>O código não vai rodar!</strong> O compilador do Dart vai te avisar antes mesmo de você executar: <em>"The property 'length' can't be unconditionally accessed because the receiver can be null."</em></p>
        <p><strong>Como corrigir?</strong> Use o operador de segurança:</p>
        <pre><code class="language-dart">print(usuario?.length); // Exibe null, mas não quebra o app!</code></pre>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #0175c2 0%, #13b9fd 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Você iniciou sua jornada no Dart!</h3>
    <p style="margin: 10px 0 0 0;">Agora que você conhece o básico, vamos avançar para como lidar com grupos de dados!</p>
</div>
