# Rick And Morty

#📝 Descrição

Aplicação criada para consulta de dados de personagens do Desenho Rick and Morty.

#📚 Funcionalidades

- Busca de lista de personagens.
- Busca de lista de personagens favoritos.
- Visualização de detalhes de personagem, como dados de localização e dados de episódios em que apareceu.
- Favoritar e Desfavoritar personagens.
- Filtro de busca de personagens por Nome e Espécie.

#🏁 Como rodar o projeto

Pré requisitos

Flutter 3.0.1 (instale através do link: https://docs.flutter.dev/get-started/install )
Emulador Android Instalado

Instalando

- Faça o clone do projeto em sua máquina.

```sh
https://github.com/gabrielapizani/rick_morty
```

- Ao abrir o projeto em seu VS Code, abra o emulador android selecionando na barra inferior do VS Code, em seguida vá ao terminal e execute os comandos:

```sh
flutter pub get
flutter run
```

#🔧Como rodar os testes da aplicação

-Vá até o terminal e execute o comando:

```sh
flutter test test/home_test.dart
```

#Bibliotecas Externas

flutter_bloc: ^8.0.1 - Foi utilizado para reconhecer eventos disparados na screen e disparar estados resultantes, ou seja, realizar o gerenciamento de estado do aplicativo. Optei por utilizá-lo devido ele ter um código mais simples, deixando o código mais limpo, diferente do pacote Provider que já bem mais complexo.

json_annotation: ^4.5.0 - Foi utilizado para desserialização e serializar de objetos Json. Optei por utilizálo para obter um código mais limpo ao invés de montar manualmente por Json decode.

dio: ^4.0.6 - Pacote que permite fazer requisições Http. Optei pelo uso deste pacote por dar uma gama de opções facilitadas como o uso de interceptors.

font_awesome_flutter: ^10.1.0 - Pacote que oferece uma ampla lista ícones para uso na aplicação. Optei por usar este pacote devido a enorme gama de ícones gratuítos.

shared_preferences: ^2.0.15 - Pacote utilizado para armazenamento de dados simples no dispositivo. Utilizei este pacote para armazenamento da lista de Id's de personagens favoritos.

#Padrão de Arquitetura Utilizado

Decidi por uma Arquitetura Modular com BloC para facilitar a leitura e edição do código. Dividindo as funcionalidades da minha aplicação por grupos, concentrando em cada grupo apenas o que lhe condiz, diminuindo o risco de erros, de leitura ou edição. Além de gerenciamento de Estados e Eventos com BloC.
