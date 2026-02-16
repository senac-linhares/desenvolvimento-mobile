# 📂 Estrutura do Projeto Flutter

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
📁 🏗️ ⚙️
</div>

Agora que você tem o ambiente pronto, ao criar seu primeiro projeto (`flutter create meu_app`), você se deparará com uma série de pastas e arquivos. Entender o que cada um faz é fundamental para não se perder no desenvolvimento.

<div class="hero-section" style="background: linear-gradient(135deg, #1e293b 0%, #334155 100%);">
    <h2>🎯 O Mapa da Mina</h2>
    <p>Vamos explorar as entranhas de um projeto Flutter. Você verá que, embora pareça complexo, você passará 90% do seu tempo em apenas um lugar!</p>
</div>

---

## 🗺️ As Pastas do Projeto
<div class="architecture-diagram">
    <img src="/content/desenvolvimento-mobile/images/Pastas-inicias-flutter.png" alt="Pastas iniciais do projeto Flutter" />
</div>

```mermaid
graph TD
    Root[📂 meu_app] --> Android[📂 android]
    Root --> IOS[📂 ios]
    Root --> Web[📂 web]
    Root --> Lib[📂 lib]
    Root --> Test[📂 test]
    Root --> Pub[📄 pubspec.yaml]
    
    style Lib fill:#0ea5e9,color:#fff,stroke-width:4px
    style Pub fill:#f59e0b,color:#fff
```

### 1️⃣ `lib/` (A Joia da Coroa) 💎
Esta é a pasta **mais importante**. É aqui que todo o seu código Dart viverá. O arquivo principal é o `main.dart`, que é o ponto de partida do seu aplicativo.

### 2️⃣ `android/` e `ios/`
Contêm os arquivos específicos de cada plataforma. Você raramente precisará mexer aqui, a menos que precise configurar permissões especiais (como câmera ou GPS) ou mudar o ícone do app.

### 3️⃣ `pubspec.yaml` (O Gerente) 📄
Este é o arquivo de configuração do seu projeto. É aqui que você:
- Define o nome e versão do app.
- Adiciona pacotes e bibliotecas externas.
- Declara assets como **imagens** e **fontes**.

---

## 🛠️ Ferramentas Visuais do VS Code

O Flutter no VS Code oferece painéis que ajudam muito:

- **Flutter Outline**: Mostra a hierarquia de widgets da tela atual.
- **Flutter DevTools**: Uma suíte de diagnóstico no navegador para inspecionar performance e layout.

<div class="callout tip">
    <div class="callout-title">💡 Dica do Mentor</div>
    Sempre que o seu app se comportar de forma estranha após você adicionar uma nova biblioteca no <code>pubspec.yaml</code>, rode o comando <code>flutter pub get</code> no terminal para atualizar as dependências!
</div>

---

## 🎯 Desafio de Organização

<div class="challenge-box">
    <h3 style="margin-top: 0;">🤔 Onde eu coloco?</h3>
    <p>Se você baixou uma imagem de um logo para usar no seu app, em qual arquivo você deve avisar ao Flutter que essa imagem existe?</p>
</div>

<details class="solution-details">
    <summary><strong>🔍 Ver Resposta</strong></summary>
    <div class="solution-content">
        <p>✅ No arquivo <strong><code>pubspec.yaml</code></strong>, dentro da seção <code>assets:</code>.</p>
    </div>
</details>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #1e293b 0%, #334155 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Projeto Mapeado!</h3>
    <p style="margin: 10px 0 0 0;">Agora que você conhece a casa, vamos aprender a falar a língua dela: o Dart!</p>
</div>
