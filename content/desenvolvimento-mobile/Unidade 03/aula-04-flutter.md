# 🔲 Layouts: Column e Row (Guia Avançado)

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
📐 🧩 🏗️
</div>

Layout é a alma do Flutter. Se você entende como o Flutter posiciona as coisas, você consegue criar qualquer interface. Se não entende, vai passar horas lutando contra barras amarelas e pretas de erro.

<div class="hero-section" style="background: linear-gradient(135deg, #4f46e5 0%, #3730a3 100%);">
    <h2>🎯 Dominando o Espaço</h2>
    <p>Vamos além do básico. Vamos entender eixos, alinhamentos, como preencher espaços vazios e como evitar o temido erro de "Overflow".</p>
</div>

---

## 🧭 O Segredo dos Eixos (Axis)

Para dominar `Column` e `Row`, você precisa entender que eles funcionam como espelhos um do outro. O segredo está em saber "Para onde eu estou olhando?".

<div class="grid-2">
    <div class="card" style="border-top: 4px solid #ef4444;">
        <h3>↕️ Column (Coluna)</h3>
        <p><strong>MainAxis (Principal):</strong> Vertical (↕️)</p>
        <p><strong>CrossAxis (Cruzado):</strong> Horizontal (↔️)</p>
        <hr>
        <p>Imagine uma pilha de pratos. O eixo principal é a altura da pilha.</p>
    </div>
    <div class="card" style="border-top: 4px solid #eab308;">
        <h3>↔️ Row (Linha)</h3>
        <p><strong>MainAxis (Principal):</strong> Horizontal (↔️)</p>
        <p><strong>CrossAxis (Cruzado):</strong> Vertical (↕️)</p>
        <hr>
        <p>Imagine livros numa prateleira. O eixo principal é a largura da prateleira.</p>
    </div>
</div>

---

## 🎛️ Opções de Alinhamento (MainAxisAlignment)

Como os itens se distribuem no eixo principal?

| Propriedade | O que faz no MainAxis? |
| :--- | :--- |
| `start` | Cola tudo no início (Topo na Coluna, Esquerda na Linha). |
| `end` | Cola tudo no fim (Baixo na Coluna, Direita na Linha). |
| `center` | Junta tudo no meio. |
| `spaceBetween` | O primeiro vai pro início, o último pro fim, e o resto se espalha igualmente. |
| `spaceAround` | Coloca espaço igual ao redor de cada item. |
| `spaceEvenly` | Distribui o espaço igualmente antes, entre e depois dos itens. |

<div class="callout info">
    <div class="callout-title">📚 Documentação Oficial</div>
    Quer ver exemplos visuais de cada alinhamento? 
    <br>👉 <a href="https://docs.flutter.dev/ui/layout#aligning-widgets" target="_blank">Acesse o Guia Oficial de Alinhamento de Widgets</a>
</div>

---

## 📏 Tamanho do Eixo Principal (MainAxisSize)

Por padrão, uma `Column` tenta ocupar **toda a altura disponível**, mesmo se tiver apenas um texto pequeno dentro. Mas você pode mudar isso!

- **MainAxisSize.max** (Padrão): Ocupa tudo (ex: tela inteira).
- **MainAxisSize.min**: Ocupa apenas o espaço necessário para os filhos.

```dart
Column(
  mainAxisSize: MainAxisSize.min, // Encolhe para caber no conteúdo
  children: [
    Text("Título"),
    Text("Subtítulo"),
  ],
)
```

<div class="callout tip">
    <div class="callout-title">💡 Quando usar .min?</div>
    É essencial ao usar widgets como <strong>Dialogs</strong> (Pop-ups) ou <strong>BottomSheets</strong>, onde você quer que a caixa tenha o tamanho exato do conteúdo e não a altura da tela inteira.
</div>

---

## ↔️ CrossAxisAlignment: O Poder do .stretch

O alinhamento cruzado tem alguns truques na manga. O mais útil é o `stretch`.

### O que o `.stretch` faz?
Ele força os filhos a ocuparem **toda a largura** (em uma Coluna) ou **toda a altura** (em uma Linha).

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    ElevatedButton(onPressed: () {}, child: Text("Botão 1")),
    ElevatedButton(onPressed: () {}, child: Text("Botão 2")),
  ],
)
```
*Resultado: Os botões ficarão com a largura total da tela, sem precisar definir um width fixo!*

---

## 🎈 Expanded e Flexible: Ocupando Espaço

Um erro comum é querer que um widget ocupe "todo o espaço que sobrou". O `Column` e `Row` não fazem isso sozinhos. Eles precisam de ajuda.

### O Widget `Expanded`
Diz ao filho: "Estique-se para ocupar todo o espaço vazio restante".

```dart
Row(
  children: [
    Icon(Icons.star), // Ocupa tamanho fixo (pequeno)
    Expanded(
      child: Container(color: Colors.red), // Ocupa TODO o resto da linha
    ),
    Icon(Icons.star), // Ocupa tamanho fixo
  ],
)
```

### O Erro de Overflow (A Faixa Amarela e Preta 🚧)
Se você colocar conteúdo demais numa `Row` ou `Column` (mais do que cabe na tela), o Flutter vai te mostrar um erro visual feio: uma faixa amarela e preta listrada.

**A Solução:** Envolva o texto longo ou o conteúdo grande em um `Expanded` ou `Flexible` para que ele saiba que deve quebrar de linha ou encolher, ao invés de estourar a tela.

---

## 🥞 Stack: O Terceiro Grande Layout

Às vezes, `Row` e `Column` não são suficientes porque você quer colocar uma coisa **em cima** da outra (sobreposição). Para isso, usamos a `Stack` (Pilha).

O `Stack` desenha os widgets na ordem da lista: o primeiro fica no fundo, o último fica no topo.

```dart
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200), // Fundo
    Positioned(
      bottom: 10,
      right: 10,
      child: Icon(Icons.favorite, color: Colors.white), // Frente
    ),
  ],
)
```

---

## 🧪 Prática: Layout Responsivo Complexo

Vamos criar um layout que usa `Expanded` para criar proporções perfeitas, simulando um feed de notícias.

```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: NewsFeedPage()));

class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feed de Notícias"), backgroundColor: Colors.black87),
      body: Column(
        children: [
          // Item 1: Notícia com Imagem Grande
          _buildNewsItem("Flutter é Incrível", "Descubra como criar apps rápidos.", Colors.blue),
          
          Divider(),
          
          // Item 2: Notícia usando Expanded para dividir espaço
          Row(
            children: [
              // Este Expanded ocupa 70% do espaço (flex: 7)
              Expanded(
                flex: 7,
                child: Container(
                  height: 100,
                  color: Colors.green[100],
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text("Manchete Principal: Ocupa 70% da tela")),
                ),
              ),
              // Este Expanded ocupa 30% do espaço (flex: 3)
              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  color: Colors.red[100],
                  child: Center(child: Text("Ads (30%)")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String subtitle, Color color) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha texto ao topo da imagem
        children: [
          // Imagem simulada (Caixa colorida)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image, color: Colors.white),
          ),
          
          SizedBox(width: 15), // Espaçamento
          
          // O Texto PRECISA estar num Expanded ou Flexible dentro de uma Row
          // Senão, se o texto for longo, vai dar erro de Overflow!
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinha textos à esquerda
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle + " Texto longo de exemplo para mostrar que ele quebra de linha automaticamente graças ao Expanded.",
                  style: TextStyle(color: Colors.grey[700]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // Coloca '...' se passar de 2 linhas
                ),
              ],
            ),
          ),
          
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
```

---

## 🎯 Desafio "Tetris"

<div class="challenge-box">
    <h3 style="margin-top: 0;">🧩 Proporção Áurea</h3>
    <p>Se eu tenho uma <code>Row</code> com 3 filhos, todos envoltos em <code>Expanded</code>. O primeiro tem <code>flex: 1</code>, o segundo <code>flex: 2</code> e o terceiro <code>flex: 1</code>. Qual fração da tela o filho do meio vai ocupar?</p>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>✅ <strong>50% da largura (Metade).</strong></p>
        <p>A soma dos fatores flux é 1 + 2 + 1 = 4 partes. O filho do meio tem 2 partes. 2/4 = 1/2.</p>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #4f46e5 0%, #3730a3 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Mestre do Layout!</h3>
    <p style="margin: 10px 0 0 0;">Agora você não só posiciona elementos, mas domina o espaço com <code>Expanded</code> e evita erros de Overflow.</p>
</div>
