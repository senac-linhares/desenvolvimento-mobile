# 🧮 Projeto 01 - Calculadora Flutter

<div align="center">
    <img src="https://img.shields.io/badge/Flutter-Iniciante-green?style=for-the-badge&logo=flutter" alt="Nível">
    <img src="https://img.shields.io/badge/Conceitos-Widgets%20%7C%20State-blue?style=for-the-badge" alt="Conceitos">
</div>

## 📋 Descrição

Uma calculadora simples que realiza as quatro operações básicas (soma, subtração, multiplicação e divisão). Este é o primeiro projeto prático do curso e serve para consolidar os conceitos de:

- ✅ Widgets básicos (Container, Text, ElevatedButton)
- ✅ StatefulWidget e gerenciamento de estado
- ✅ Eventos de clique (onPressed)
- ✅ Layout com Column e Row
- ✅ Estilização básica

## 🎯 Objetivos de Aprendizado

Ao completar este projeto, você será capaz de:

1. Criar uma interface de usuário funcional
2. Gerenciar o estado de uma aplicação
3. Responder a eventos do usuário
4. Organizar widgets em layouts
5. Aplicar estilos personalizados

## 🖼️ Preview

```
┌─────────────────────┐
│      0              │  ← Display
├─────────────────────┤
│  7  │  8  │  9  │ ÷ │
├─────────────────────┤
│  4  │  5  │  6  │ × │
├─────────────────────┤
│  1  │  2  │  3  │ - │
├─────────────────────┤
│  C  │  0  │  =  │ + │
└─────────────────────┘
```

## 📚 Conceitos Abordados

### 1. StatefulWidget
```dart
class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}
```

### 2. Gerenciamento de Estado
```dart
class _CalculadoraState extends State<Calculadora> {
  String display = '0';
  double primeiroNumero = 0;
  String operacao = '';
  
  // Métodos para atualizar o estado...
}
```

### 3. Eventos de Botão
```dart
ElevatedButton(
  onPressed: () {
    setState(() {
      display += '1';
    });
  },
  child: Text('1'),
)
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK instalado
- VS Code ou Android Studio
- Emulador ou dispositivo físico

### Passos

1. **Clone o repositório** (se ainda não fez):
```bash
git clone https://github.com/seu-usuario/prof-dev.git
cd prof-dev/projetos/01-calculadora
```

2. **Instale as dependências**:
```bash
flutter pub get
```

3. **Execute o app**:
```bash
flutter run
```

## 📝 Desafios Extras

Depois de completar a calculadora básica, tente:

- [ ] 🎨 Adicionar cores diferentes para cada tipo de botão
- [ ] 🔢 Implementar operações com decimais
- [ ] 📜 Criar um histórico de cálculos
- [ ] 🌙 Adicionar modo escuro (dark mode)
- [ ] ⌨️ Permitir entrada via teclado físico

## 🐛 Problemas Comuns

### O app não compila
```bash
# Limpe o cache e reinstale
flutter clean
flutter pub get
flutter run
```

### Botões não respondem
Verifique se você está usando `setState()` para atualizar o display.

### Layout quebrado
Certifique-se de que está usando `Expanded` ou `Flexible` dentro de Row/Column.

## 📖 Recursos Adicionais

- 📚 [Documentação: StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- 🎥 [Vídeo: Como funciona o setState](https://www.youtube.com/watch?v=example)
- 💬 [Discussão no Discord](https://discord.gg/flutter)

## ✅ Checklist de Conclusão

Antes de considerar o projeto completo, verifique:

- [ ] Todas as 4 operações funcionam corretamente
- [ ] O botão "C" limpa o display
- [ ] Não há erros de divisão por zero
- [ ] O layout está organizado e legível
- [ ] O código está comentado

## 🎓 Próximo Projeto

Depois de dominar a calculadora, você estará pronto para o **Projeto 02: Lista de Tarefas**, onde aprenderemos sobre:
- ListView dinâmico
- CRUD (Create, Read, Update, Delete)
- Persistência de dados local

---

<div align="center">
    <p>💪 Continue praticando e se torne um desenvolvedor Flutter!</p>
    <p>Dúvidas? Pergunte no Discord da turma!</p>
</div>
