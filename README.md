# IoT.SE.Opt.T - Virtual guitar pedal board (Pedaleira Virtual para Guitarras)

## Motivação

A Pedaleira Virtual para Guitarras surge da necessidade de proporcionar aos guitarristas uma solução prática e versátil para experimentar e criar efeitos sonoros sem a necessidade de equipamentos físicos. Com a Pedaleira Virtual, os músicos podem explorar uma ampla gama de efeitos de guitarra diretamente de seus computadores, facilitando o processo de composição, prática e gravação de músicas.

## Objetivos

- Oferecer uma experiência de pedaleira de guitarra completa e intuitiva através de uma aplicação virtual.
- Permitir aos usuários experimentar uma variedade de efeitos sonoros, incluindo distorção, delay, reverb, chorus, entre outros.
- Facilitar a criação e personalização de presets de efeitos para diferentes estilos musicais e preferências individuais.
- Integrar funcionalidades avançadas, como simulações de amplificadores e modelagem de gabinetes, para uma experiência sonora mais autêntica.
- Fornecer uma plataforma flexível e de código aberto para futuras expansões e colaborações da comunidade de músicos e desenvolvedores.

## Arquitetura


## Manual de Instalação e Configuração


### Instalação

#### Instalação e utilização do arduino cloud

##### Instalação do Arduino Create Agent:

- Acesse o site oficial do Arduino Cloud em https://create.arduino.cc/.
- Faça login na sua conta Arduino ou crie uma nova, se necessário.
- Na página inicial, clique em "Get Started" ou "Começar".
- Siga as instruções para baixar e instalar o Arduino Create Agent, que é necessário para conectar suas placas Arduino ao Arduino Cloud.
- Depois de instalado, abra o Arduino Create Agent e faça login com suas credenciais do Arduino.

##### Configuração do Arduino Cloud:

- Com o Arduino Create Agent aberto e logado, conecte sua placa Arduino ao computador utilizando um cabo USB.
- Abra o navegador da web e acesse o Arduino Web Editor em https://create.arduino.cc/editor.
- No Arduino Web Editor, clique no ícone de configurações no canto superior direito da tela.
- Selecione "Arduino Cloud" nas opções de configuração.
- Selecione a placa Arduino que você está usando na lista de placas suportadas.
- Siga as instruções para conectar sua placa Arduino ao Arduino Cloud através do Arduino Create Agent. Isso geralmente envolve emparelhar a placa com sua conta Arduino.

##### Utilização do Arduino Cloud:
- Com a placa Arduino conectada ao Arduino Cloud, você pode começar a criar e carregar sketches diretamente do Arduino Web Editor.
- No Arduino Web Editor, clique em "Novo Sketch" para criar um novo código.
- Escreva o código do seu sketch na área de edição.
- Quando estiver pronto para carregar o sketch na placa Arduino, clique no botão "Upload" na barra de ferramentas.
- O código será compilado e carregado na placa Arduino automaticamente.
- Pode-se monitorar a saída serial da placa Arduino diretamente no Arduino Web Editor clicando em "Monitor Serial" na barra de ferramentas.

### Configuração


## Referências

- Documentação: relacionada a inspiração para o projeto:
  - [ElectroSmash](https://www.electrosmash.com/pedal-pi)
  - [NeuralPi](https://github.com/GuitarML/NeuralPi)
  - [Pi-FX : A Raspberry Pi-Based Pedal Board](https://tibbbz.medium.com/guitarix-the-pi-dle-board-8d6298ca8e42)
- Godot engine: [https://godotengine.org](https://godotengine.org)
- Arduino Cloud: [Getting Started With Arduino Cloud](https://docs.arduino.cc/arduino-cloud/guides/overview/)
