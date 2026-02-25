##CONFIGURANDO O FLUTTER

1 - ABRA AS VARIAVEIS DE AMBIENTE E REMOVA O PATH QUE ADICIONAMOS ONTEM.

2 - REINICIE SEU COMPUTADOR

3 - ABRA O POWERSHELL e digite o seguinte comando:
C:\Users\Aluno> ```where flutter```
resultado deve ser:
```
C:\dev\flutter\bin\flutter
C:\dev\flutter\bin\flutter.bat
```

4 - ACESSE O C: E VEJA SE SEU PC JÁ TEM A PASTA DEV:


---- NÃO TEM A PASTA DEV.
     
	- CRIE UMA PASTA CHAMADA dev
	- CRIE UMA NOVA PASTA DENTRO DE DEV CHAMADA flutter
	- Copie todos os arquivos da pasta flutter em %USERPROFILE%/develop/flutter para a pasta flutter em c:/dev/flutter

---- JA TEM A PASTA

        - APAGUE TODOS OS ARQUIVOS DENTRO DA PASTA FLUTTER.
	- Copie todos os arquivos da pasta flutter em %USERPROFILE%/develop/flutter para a pasta flutter em c:/dev/flutter

5 - VOLTE AO POWESHELL E DIGITE flutter doctor

Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 3.41.2, on Microsoft Windows [versÆo 10.0.26200.7840], locale pt-BR)
[√] Windows Version (11 Education 64-bit, 25H2, 2009)
[!] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
[√] Chrome - develop for the web
[√] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.13.1)
[√] Connected device (3 available)
[√] Network resources
