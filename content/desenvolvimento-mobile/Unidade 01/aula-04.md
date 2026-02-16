# 📱 Configuração do Ambiente: Android e iOS

<div style="text-align: center; font-size: 3rem; margin: 20px 0;">
🤖 🍎 ⚙️
</div>

Agora que o SDK do Flutter já está no seu computador, precisamos configurar os "motores" que permitem testar seus apps em celulares reais ou virtuais. 

<div class="hero-section" style="background: linear-gradient(135deg, #f97316 0%, #ea580c 100%);">
    <h2>🎯 Além do Navegador</h2>
    <p>Rodar na Web é ótimo para começar, mas o verdadeiro poder do Flutter está no mobile. Vamos preparar o Android Studio e os Emuladores para ver seu app ganhando vida no celular!</p>
</div>

---

## 🤖 1. Configurando o Android

O Android Studio é a ferramenta oficial do Google que contém o SDK do Android, necessário para compilar seus apps.

### 📥 Passo a Passo:
1. [Baixe o Android Studio aqui](https://developer.android.com/studio).
2. Durante a instalação, escolha a opção **"Standard"**.
3. Ao terminar, abra o Android Studio e vá em **More Actions > SDK Manager**.
4. Na aba **SDK Tools**, certifique-se de marcar: **Android SDK Command-line Tools**.
5. Clique em Apply e aguarde o download.

---

## ⚖️ 2. Aceitando as Licenças

O Google exige que você aceite formalmente os termos de uso do Android SDK. Sem isso, o Flutter não conseguirá criar seus apps.

No terminal do seu computador (ou do VS Code), digite:

```bash
flutter doctor --android-licenses
```

Pressione **"y"** (yes) e Enter para cada uma das licenças que aparecerem.

---

## 📱 3. Criando um Emulador (Celular Virtual)

Se você não quer ficar prendendo seu celular no cabo USB, pode usar um celular virtual no seu PC.

1. No Android Studio, vá em **More Actions > Virtual Device Manager**.
2. Clique em **Create Device**.
3. Escolha um modelo (ex: Pixel 7).
4. Baixe uma versão do sistema (ex: "UpsideDownCake" ou "Tiramisu").
5. Finalize a criação.

---

## 🔌 4. Usando o Próprio Celular (Recomendado)

Rodar no celular físico é muito mais rápido e dá a sensação real do app!

### No seu Android:
1. Vá em **Configurações > Sobre o Telefone**.
2. Clique **7 vezes** no "Número da Versão" até ativar o **Modo Desenvolvedor**.
3. Procure por **Opções do Desenvolvedor** e ative a **Depuração USB**.
4. Conecte no PC e autorize a conexão na tela do celular.

<div class="callout tip">
    <div class="callout-title">💡 Dica de Performance</div>
    Emuladores consomem <strong>muita memória RAM</strong>. Se o seu computador estiver lento, use sempre o celular físico com cabo USB. Seu PC vai agradecer!
</div>

---

<div style="text-align: center; padding: 40px 0; background: linear-gradient(135deg, #f97316 0%, #ea580c 100%); border-radius: 12px; color: white; margin-top: 40px;">
    <h3 style="color: white; margin: 0;">🎉 Ambiente Android Configurado!</h3>
    <p style="margin: 10px 0 0 0;">Agora você tem tudo pronto para ver seu app rodando fora do navegador!</p>
</div>
