# Agro Info

Aplicativo integrado com 2 APIs da EMBRAPA para listar pragas e fazer o calculo do risco de plantio de certa cultura.

## Arquitetura do Projeto

### Camadas

Esta aplicação está represetnada em 2 camadas, sendo elas:

**Common:** Responsável por armazenar os arquivos comuns que são utilizados diversas vezes, em diversas páginas.  
**Pages:** Responsável por armazenar os arquivos de cada página/tela presente na aplicação.

### Common

A camada common será representada por **Models**, **Services**, **States**, **Viewmodels**, **Enums** e **Widgets**.

- **Models**: Um model é responsável por representar um dado e pode ser agregado a outros mdoels.

- **Services**: Um service é responsável por gerenciar as requisições a APIs externas.

- **States**: Um state é responsável por armazenar os estados disponíveis que uma página pode representar.

- **Viewmodels**: Uma viewmodel é responsável por gerenciar os estados de uma página.

- **Enums**: Um enum é responsável por representar os dados enumerados onde se tem o conhecimento de quais valores eles podem assumir.

- **Widgets**: Um widget é responsável por armazenar um componente de UI que será usado em mais de uma page.

### Pages

A camada pages já tem diretamente as páginas que a compõem.  
Uma page é responsável por armazenar os arquivos que constroem a UI dela.

## Pré-requisitos

- Flutter instalado
- Android Studio Instalado

## Instalação

### Primeiro Passo

Certifique-se de ter o [**Flutter**](https://docs.flutter.dev/install/quick?_gl=1%2Ay7hfza%2A_ga%2AMTk3OTM2NDg0NS4xNzcyNjMxODYy%2A_ga_04YGWK0175%2AczE3NzM5MTkyOTMkbzExJGcxJHQxNzczOTE5MzMwJGoyMyRsMCRoMA..) e [**Android Studio**](https://developer.android.com/studio?hl=pt-br) instalados.

### Segundo Passo

Clone o repositório na sua máquina, você pode fazer isso com o comando:

    git clone https://github.com/Scalco7/agro_info.git

### Terceiro Passo

Entre na pasta criada

    cd agro_info

### Quarto Passo  

Crie um arquivo config.json na raiz do projeto e utilize o exemplo a seguir como padrão:

    {
        "EMBRAPA_API_KEY": "[Sua chave de API]"
    }

### Quinto Passo  

Rode o comando:

    flutter run --dart-define-from-file=config.json

e acesse o aplicativo que será aberto no emulador.

## Notas

- Para fazer as animações utilizei a lib lottie.

- Para fazer a splash screen utilizei flutter_native_splash.

- Para fazer os icones nativo utilizei flutter_launcher_icons.

- Para manter o estado do view model utilizei o Provider.

Tenho certeza que aprendi muito com o projeto, e com toda a jornada de criação.

## Created By

    Felipe Maciel Scalco
