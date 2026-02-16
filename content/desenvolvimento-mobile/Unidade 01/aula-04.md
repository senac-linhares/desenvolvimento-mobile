# 📦 Coleções em Dart

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
📚 🗺️ 🔗
</div>

No desenvolvimento mobile, raramente lidamos com dados sozinhos. Geralmente, trabalhamos com listas de usuários, mapas de configurações ou conjuntos de categorias. O Dart oferece coleções poderosas para gerenciar esses dados com facilidade.

<div class="hero-section" style="background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);">
    <h2>🎯 Manipulando Dados com Estilo</h2>
    <p>Aprenda a usar Listas, Mapas e Conjuntos, e como transformar dados usando programação funcional em Dart. Isso é essencial para lidar com APIs!</p>
</div>

---

## 1️⃣ Listas (Lists)

As listas são coleções ordenadas de objetos. No Dart, as listas são arrays de tamanho variável por padrão.

```dart
var frutas = ["Banana", "Maçã", "Laranja"];
frutas.add("Morango");
print(frutas[0]); // Banana

// Lista tipada e imutável (Boa prática!)
const List<String> nomes = ["Welton", "Ana", "Carlos"];
```

---

## 2️⃣ Mapas (Maps)

Diferente das listas que usam índices numéricos (0, 1, 2...), os mapas usam **chaves e valores**. É muito similar ao formato JSON que usamos para receber dados da internet.

```dart
Map<String, dynamic> usuario = {
  "nome": "Professor Flutter",
  "idade": 25,
  "esta_ativo": true
};

print(usuario["nome"]); // Professor Flutter
```

<div class="callout warning">
    <div class="callout-title">⚠️ Chaves em Mapas</div>
    Se você tentar acessar uma chave que não existe em um mapa, o Dart retornará <code>null</code> em vez de lançar um erro. Sempre verifique se o dado existe antes de usar!
</div>

---

## 3️⃣ Conjuntos (Sets)

Um **Set** é uma coleção de itens únicos. Se você tentar adicionar um item duplicado, ele será ignorado. Perfeito para quando você não quer repetições (como uma lista de IDs de usuários).

```dart
var numeros = {1, 2, 3, 3, 3}; 
print(numeros); // {1, 2, 3} - Os repetidos sumiram!
```

---

## 🪄 Operadores Mágicos (.map, .where)

O Dart permite processar coleções de forma funcional, economizando linhas de código e evitando erros.

```dart
var precos = [10, 25, 50, 100];

// 🔍 Filtrar: apenas preços maiores que 30
var caros = precos.where((p) => p > 30).toList();

// ✨ Transformar (Mapear): aumentar todos em 10%
var novosPrecos = precos.map((p) => p * 1.1).toList();
```

<div class="callout tip">
    <div class="callout-title">💡 Spread Operator (...)</div>
    Você pode "espalhar" os elementos de uma lista dentro de outra usando <code>...</code>. 
    Ex: <code>var todos = [...listaA, ...listaB];</code>
</div>

---

## 🎯 Desafio de Lógica

<div class="challenge-box">
    <h3 style="margin-top: 0;">🧠 Missão de Dados</h3>
    <p>Dada a lista de notas abaixo, como você obteria apenas os alunos que foram <strong>aprovados</strong> (nota >= 7) e transformaria seus nomes para <strong>MAIÚSCULO</strong>?</p>
    <pre><code class="language-dart">var alunos = [
  {"nome": "João", "nota": 8},
  {"nome": "Maria", "nota": 6},
  {"nome": "Pedro", "nota": 9}
];</code></pre>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Solução</strong></summary>
    <div class="solution-content">
        <pre><code class="language-dart">var aprovados = alunos
  .where((a) => a["nota"] >= 7)
  .map((a) => a["nome"].toString().toUpperCase())
  .toList();

print(aprovados); // [JOÃO, PEDRO]</code></pre>
        <p><strong>Dica:</strong> O <code>.toList()</code> é necessário porque métodos como <code>map</code> devolvem um "Iterable" (um rastro de dados), e nós queremos uma Lista real de volta.</p>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Mestre das Coleções!</h3>
    <p style="margin: 10px 0 0 0;">Agora você sabe como organizar e transformar dados como um pro!</p>
</div>
