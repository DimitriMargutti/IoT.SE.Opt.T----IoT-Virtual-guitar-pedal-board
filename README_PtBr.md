# IoT.SE.Opt.T - Pedalboard Virtual para Guitarras (Virtual guitar pedal board)

## Visão Geral:

A Pedaleira Virtual para Guitarras foi desenvolvida para atender à necessidade de oferecer aos guitarristas uma solução prática e versátil para experimentar e criar efeitos sonoros, eliminando a dependência de equipamentos físicos volumosos e caros. Com esta pedaleira virtual, os músicos têm a liberdade de explorar uma vasta gama de efeitos de guitarra diretamente em seus computadores. Isso simplifica e enriquece o processo de composição, prática e gravação de músicas, permitindo que os guitarristas ajustem e personalizem seus sons de maneira intuitiva e eficiente. Além disso, a pedaleira virtual proporciona um ambiente ideal para testar novas ideias e configurações de efeitos, ajudando a inspirar a criatividade musical.

## Motivação para o projeto

A Pedaleira Virtual para Guitarras nasceu da necessidade de proporcionar aos guitarristas uma solução inovadora e acessível para explorar e criar efeitos sonoros de alta qualidade sem depender de equipamentos físicos caros e volumosos. Os guitarristas, sejam iniciantes ou profissionais, frequentemente enfrentam desafios ao tentar encontrar e combinar diversos pedais e equipamentos para obter os sons desejados. Isso não só demanda um investimento financeiro significativo, mas também pode ser logisticamente complicado, especialmente durante viagens ou apresentações ao vivo.

Com a Pedaleira Virtual, buscamos resolver esses problemas oferecendo uma plataforma digital que permite aos músicos acessar uma ampla gama de efeitos de guitarra diretamente de seus computadores. Nossa solução facilita o processo de composição, prática e gravação, permitindo que os guitarristas ajustem e personalizem seus sons com facilidade e precisão. Além disso, a pedaleira virtual é ideal para experimentação, incentivando a criatividade e a inovação musical. Os guitarristas podem testar novas combinações de efeitos e configurações sem limitações físicas, ajudando-os a descobrir novos sons e estilos.

Em suma, a motivação para criar a Pedaleira Virtual para Guitarras é fornecer aos músicos uma ferramenta poderosa, flexível e acessível que eleve suas habilidades e expanda suas possibilidades criativas, tudo isso enquanto elimina as barreiras impostas pelos equipamentos tradicionais.

## Objetivos do projeto

- Proporcionar uma Experiência Completa e Intuitiva:
  - Desenvolver uma aplicação virtual que oferece uma experiência de pedaleira de guitarra completa e intuitiva, permitindo que os usuários naveguem e utilizem facilmente os diversos recursos e efeitos disponíveis.

- Variedade de Efeitos Sonoros:
  - Permitir aos usuários experimentar uma ampla gama de efeitos sonoros, incluindo distorção, delay, reverb, chorus, entre outros, possibilitando a criação de sons únicos e personalizados para cada estilo musical.

- Criação e Personalização de Presets:
  - Facilitar a criação e personalização de presets de efeitos, permitindo que os guitarristas ajustem os parâmetros de acordo com diferentes estilos musicais e preferências individuais, armazenando configurações para fácil acesso e reutilização.

- Funcionalidades Avançadas:
  - Integrar funcionalidades avançadas, como simulações de amplificadores e modelagem de gabinetes, proporcionando uma experiência sonora mais autêntica e realista, que se aproxima dos equipamentos físicos tradicionais.

- Plataforma Flexível e de Código Aberto:
  - Fornecer uma plataforma flexível e de código aberto que permite futuras expansões e colaborações da comunidade de músicos e desenvolvedores, incentivando a inovação contínua e a melhoria do software através de contribuições comunitárias.

## Arquitetura e protocolos de comando

A Pedaleira Virtual para Guitarras utiliza uma arquitetura baseada em comunicação via WebSocket, permitindo uma interação eficiente e em tempo real entre o usuário e o sistema. A seguir, descrevemos os principais componentes e o fluxo de funcionamento do projeto:

- Conexão da Guitarra ao Computador:
  - O usuário conecta a guitarra a um dispositivo de interface de áudio, conhecido como Guitar Link, que está conectado ao computador. O Guitar Link converte o sinal analógico da guitarra em um formato digital que pode ser processado pela aplicação.
 
<img src="Images/Guitarlink.png" alt="Architecture">

| **Características**                                                                                             | **Descrição**                                                                                                                                                          |
|---------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Saída Adicional                                                                                               | P10 para fone de ouvido estéreo ou para monitoramento com alto-falantes ativos (caixas).                                                                             |
| Compatibilidade                                                                                               | Trabalha diretamente com PC ou MAC, acompanha CD de instalação.                                                                                                      |
| Durabilidade                                                                                                  | Componentes de alta qualidade que garantem a durabilidade.                                                                                                           |
| Alimentação USB                                                                                               | Porta USB não necessita de alimentação externa.                                                                                                                      |
| Instalação                                                                                                    | Fácil instalação (PLUG and PLAY).                                                                                                                                    |
| Interface USB                                                                                                | Guitar Link é um dispositivo com interface USB que permite conectar facilmente sua guitarra ao PC para um trabalho profissional de amplificação, gravação e edição.  |
| Efeitos                                                                                                       | Uso dos efeitos clássicos em estúdio bem como no palco.                                                                                                              |
| Gravação e Edição                                                                                            | Gravação digital e edição de alta qualidade.                                                                                                                          |
| Reprodução de Arquivos                                                                                       | Reprodução de arquivos MP3, WAV, AIFF.                                                                                                                               |
| Compatibilidade com Sistemas Operacionais                                                                    | Compatível com Mac OS e Windows XP/Vista/7/8.                                                                                                                        |
| Reprodução em Tempo Real                                                                                      | Reprodução em tempo real sem latência/atraso na reprodução.                                                                                                           |
| Qualidade de Áudio                                                                                           | Som estéreo para fones de ouvido, qualidade de áudio 16-bit, 44.1/48kHz.                                                                                              |


- Biblioteca de Áudio e Engine de Processamento:
  - No computador, uma biblioteca de áudio dedicada recebe o sinal digital da guitarra. Esta biblioteca é responsável por capturar e preparar o áudio para processamento. Em seguida, a engine de efeitos de áudio entra em ação, pronta para aplicar os efeitos selecionados pelo usuário.

- Aplicação Cliente no Celular:
  - O usuário interage com a Pedaleira Virtual através de uma aplicação cliente no celular. Esta aplicação oferece uma interface intuitiva para selecionar, configurar e ajustar os efeitos desejados.

- Comunicação via WebSocket:
  - A aplicação cliente no celular se comunica com o servidor na Raspberry 4 model B usando WebSockets. Esta tecnologia permite uma comunicação bidirecional em tempo real, essencial para garantir que as alterações de efeitos feitas pelo usuário sejam aplicadas instantaneamente.
 
<img src="Images/rasp.png" alt="rasp">
 
### Raspberry Pi Specifications

| Feature                                      | Description                                                                                        |
|----------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Processor**                                | Broadcom BCM2711, Quad core Cortex-A72 (ARM v8) 64-bit SoC @ 1.8GHz                                |
| **Memory**                                   | 1GB, 2GB, 4GB or 8GB LPDDR4-3200 SDRAM (depending on model)                                        |
| **Wireless**                                 | 2.4 GHz and 5.0 GHz IEEE 802.11ac wireless, Bluetooth 5.0, BLE                                     |
| **Ethernet**                                 | Gigabit Ethernet                                                                                   |
| **USB Ports**                                | 2 USB 3.0 ports; 2 USB 2.0 ports                                                                   |
| **GPIO Header**                              | Raspberry Pi standard 40 pin GPIO header (fully backwards compatible with previous boards)         |
| **Display**                                  | 2 × micro-HDMI® ports (up to 4kp60 supported)                                                      |
| **MIPI DSI Display Port**                    | 2-lane MIPI DSI display port                                                                       |
| **MIPI CSI Camera Port**                     | 2-lane MIPI CSI camera port                                                                        |
| **Audio/Video Port**                         | 4-pole stereo audio and composite video port                                                       |
| **Video Decode/Encode**                      | H.265 (4kp60 decode), H264 (1080p60 decode, 1080p30 encode)                                         |
| **Graphics**                                 | OpenGL ES 3.1, Vulkan 1.0                                                                          |
| **Storage**                                  | Micro-SD card slot for loading operating system and data storage                                   |
| **Power Supply**                             | 5V DC via USB-C connector (minimum 3A*), 5V DC via GPIO header (minimum 3A*), Power over Ethernet (PoE) enabled (requires separate PoE HAT) |
| **Operating Temperature**                    | 0 – 50 degrees C ambient                                                                           |


- Aplicação dos Efeitos:
  - Quando o usuário seleciona e configura os efeitos na aplicação do celular, essas configurações são enviadas ao servidor através do WebSocket. O servidor, por sua vez, aplica os efeitos recebidos ao áudio da guitarra em tempo real, utilizando a engine de processamento de áudio.

- Retorno do Áudio Processado:
  - Após a aplicação dos efeitos, o áudio processado é devolvido ao cliente. O usuário então ouve o som da guitarra com os efeitos aplicados diretamente em seu dispositivo, permitindo um feedback imediato e uma experiência de uso contínua e sem latência perceptível.

<img src="Images/architecture.png" alt="Architecture">

### Benefícios da Arquitetura
- Interatividade em Tempo Real: A comunicação via WebSocket garante que as mudanças feitas na aplicação cliente sejam refletidas imediatamente no áudio processado.
- Flexibilidade e Personalização: Os usuários podem personalizar uma vasta gama de efeitos diretamente do celular, ajustando parâmetros em tempo real conforme suas necessidades e preferências.
- Integração Simples: O uso de um Guitar Link simplifica a conexão da guitarra ao sistema, tornando a configuração acessível tanto para iniciantes quanto para profissionais.
- Experiência Autêntica: A engine de processamento de áudio no computador aplica os efeitos com alta fidelidade, proporcionando uma experiência sonora autêntica que se aproxima da utilização de equipamentos físicos tradicionais.
  
Essa arquitetura moderna e eficiente não só atende às necessidades práticas dos guitarristas, como também abre caminho para futuras expansões e melhorias, mantendo a flexibilidade e a colaboração aberta como pilares fundamentais do projeto.
## Dashboard

<img src="Images/D1.png" alt="d1">

- Título da Dashboard:
  - O texto “START CLIENT SEND TEST PACKET” está no topo da tela.
- Status do Cliente:
  - Logo abaixo do título, há uma linha que diz “CLIENT STATUS CONECTADO ID# 78829240”. Isso indica que o cliente está conectado e possui um ID específico.
- Opção “ADD EFFECT”:
  - Na parte inferior da tela, há um botão ou opção chamado “ADD EFFECT”. Isso sugere que o usuário pode adicionar algum efeito ou camada ao aplicativo.

<img src="Images/D2.png" alt="d2">
 
Após selecionar a opção “ADD EFFECT”, você provavelmente verá uma tela com diferentes tipos de efeitos de áudio para aplicar à sua pedaleira virtual de guitarra. Aqui estão algumas possíveis opções que podem aparecer:

- Delay (Atraso):
  - O efeito de delay adiciona repetições do som da guitarra, criando um efeito de eco. Você pode ajustar o tempo entre as repetições e a quantidade de feedback.
- Overdrive (Saturação):
  - O overdrive é usado para adicionar distorção suave ao som da guitarra, dando-lhe um timbre mais quente e “sujinho”.
- Reverb (Reverberação):
  - O reverb simula o som de tocar em diferentes ambientes, adicionando profundidade e ambiente ao som da guitarra.
 
<img src="Images/D3.png" alt="d3">
 
Se a opção “Reverb” for selecionada, você poderá ajustar as configurações de reverberação para dar à guitarra um som mais espaçoso e ambiental. Aqui estão algumas opções que você pode encontrar:

A interface exibe duas seções relacionadas a efeitos de áudio:

- Reverb (Reverberação):
  - A seção “REVERB” está ativa, indicando que o efeito de reverberação está sendo aplicado.
  - Há uma opção para “REMOVE EFFECT”, que permite desativar o reverb.
- Tamanho da Sala (ROOM SIZE):
  - O parâmetro está definido como “0.8” que controla o tamanho simulado da sala para o efeito de reverberação.

## Hora de fazer você mesmo!

Para informações sobre como instalar e configurar os aplicativos utilizados neste projeto [clique aqui](https://github.com/DimitriMargutti/IoT.SE.Opt.T---Virtual-guitar-pedal-board/blob/main/Instalation_and_configuration/README.md)

## Mentoria

Este projeto foi desenvolvido com a mentoria de [Dhiego Fernandes](https://github.com/DhiegoFC/IoT_for_Embedded_Devices) Carvalho professor at State University of São Paulo

## Referências

- Documentação: relacionada à inspiração para o projeto:
  - [GDExtension](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/index.html)
  - [Godot Engine](https://godotengine.org)
  - [PortAudio](https://github.com/PortAudio/portaudio)
  
