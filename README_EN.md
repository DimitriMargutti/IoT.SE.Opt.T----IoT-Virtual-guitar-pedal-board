# IoT.SE.Opt.T - Virtual guitar pedal board

## Motivation

The Virtual Pedalboard for Guitars arises from the need to provide guitarists with a practical and versatile solution to experiment and create sound effects without the need for physical equipment. With the Virtual Pedalboard, musicians can explore a wide range of guitar effects directly from their computers, facilitating the process of composition, practice, and music recording.

## Objectives

- Provide a complete and intuitive guitar pedalboard experience through a virtual application.
- Allow users to experiment with a variety of sound effects, including distortion, delay, reverb, chorus, among others.
- Facilitate the creation and customization of effect presets for different musical styles and individual preferences.
- Integrate advanced features, such as amplifier simulations and cabinet modeling, for a more authentic sound experience.
- Provide a flexible and open-source platform for future expansions and collaborations within the community of musicians and developers.

## Architecture

### Project Construction

The main architecture of the project uses the following scheme:

<img src="Images/MainCircuit.png" alt="Architecture" width="" height="">

Where we have:

- Based on Raspberry Pi Zero (1GHz ARM11 core).
- Analog stages using MCP6002 rail-to-rail operational amplifier.
- ADC: 12 bits / Sampling Rate 50Ksps (MCP3202).
- Output Stage: 12 bits (2x6bits PWMs running in parallel)
- Pi Zero:
    - 1GHz ARM11 core.
    - 512MB of LPDDR2 SDRAM.
    - Micro-SD card slot.
- Connectors:
    - Input Jack, 1/4 inch unbalanced, Zin=0.5MΩ.
    - Output Jack, 1/4 inch unbalanced, Zout=100Ω.
    - Power supply: power taken from the Pi Zero board (micro-USB).

<img src="Images/Components.png" alt="Components" width="600" height="600">

### Operation

- The Input Stage: Amplifies and filters the guitar signal making it ready for the ADC (Analog to Digital Converter). The ADC sends the signal to the PI ZERO using SPI communication.
  
- Pi ZERO: It takes the digitalized audio waveform from the ADC and does all the Digital Signal Processing (DSP) creating effects (distortion, fuzz, delay, echo, tremolo...) that, in turn, must be pre-selected from the dashboard in the user's mobile application. From the user's selection, the application establishes communication with the board through MQTT.
  
- The Output Stage: Once the new digital waveform is created, the Pi Zero creates an analog signal with two PWMs combined, the signal is filtered and prepared to be sent to the next pedal or the guitar amp.
  
Therefore, the operation can be represented by the following images:

<img src="Images/AmpCircuit.png" alt="Operation" width="" height="">

<img src="Images/ComunicationProcess.png" alt="Comunication" width="1200" height="600">

### Application and Dashboard

For the creation of the application, it is intended to use the Godot software, widely used for game development, thus enabling an intuitive and functional application. It is intended to create a user login system, so that it is possible to save musical styles and pedal profiles, allowing greater customization by the user.

The following image serves as a login screen concept:

<img src="Images/loginScreenConceptualImage.jpg" alt="Login screen" width="600" height="400">

And the following image serves as inspiration for the creation of the dashboard:

<img src="Images/DashboardInspiration.png" alt="Dashboard" width="" height="">

## Installation and Configuration Manual

### Installation and use of Arduino Cloud

#### Arduino Create Agent Installation:

- Access the official Arduino Cloud website at https://create.arduino.cc/.
- Log in to your Arduino account or create a new one if necessary.
- On the homepage, click on "Get Started".
- Follow the instructions to download and install the Arduino Create Agent, which is necessary to connect Arduino boards to the Arduino Cloud.
- After installation, open the Arduino Create Agent and log in with your Arduino credentials.

#### Arduino Cloud Configuration:

- With the Arduino Create Agent open and logged in, connect your Arduino board to the computer using a USB cable.
- Open the web browser and access the Arduino Web Editor at https://create.arduino.cc/editor.
- In the Arduino Web Editor, click on the settings icon in the upper right corner of the screen.
- Select "Arduino Cloud" in the configuration options.
- Select the Arduino board you are using from the list of supported boards.
- Follow the instructions to connect your Arduino board to the Arduino Cloud through the Arduino Create Agent. This usually involves pairing the board with your Arduino account.

#### Using Arduino Cloud:

- With the Arduino board connected to the Arduino Cloud, you can start creating and uploading sketches directly from the Arduino Web Editor.
- In the Arduino Web Editor, click on "New Sketch" to create a new code.
- Write the code of your sketch in the editing area.
- When ready to upload the sketch to the Arduino board, click on the "Upload" button in the toolbar.
- The code will be compiled and uploaded to the Arduino board automatically.
- You can monitor the serial output of the Arduino board directly in the Arduino Web Editor by clicking on "Serial Monitor" in the toolbar.

### Installation and Use of Godot Engine

#### Godot Installation

- Access the official Godot website at https://godotengine.org/.
- Click on the "Download" button on the homepage.
- Choose the version of Godot you want to download. It is recommended to download the latest stable version.
- Select the correct operating system for which you want to download Godot (Windows, macOS, Linux).
- Download the appropriate installer for your operating system.
- After downloading, run the installer and follow the instructions to complete the installation of Godot.

#### Godot Configuration:

- After installation, open the Godot Engine.
- You will be presented with the Project Manager. Here you can create a new project or open an existing one.
- To create a new project, click on "New Project" and select the location where you want to save the project.
- Choose an initial template for your project. For example, you can choose between 2D, 3D, or an empty project.
- After creating the project, you will be taken to the main Godot editor.

#### Using Godot:

- In the Godot editor, you can start creating and developing your game or application.
- Use the scene hierarchy to organize the elements of your game.
- Add new nodes to your scenes using the node panel. There are nodes for sprites, colliders, audio, scripts, and much more.
- Create scripts to add behaviors and logic to your game. Godot uses its own scripting language called GDScript, but also supports other languages like C#.
- Test your game or application by clicking on the "Play" button to see it in action in the editor.
- When you are satisfied with your project, you can export it to various platforms, such as Windows, macOS, Linux, Android, iOS, HTML5, among others.


## References

- Documentation: related to project inspiration:
  - [ElectroSmash](https://www.electrosmash.com/pedal-pi)
  - [NeuralPi](https://github.com/GuitarML/NeuralPi)
  - [Pi-FX : A Raspberry Pi-Based Pedal Board](https://tibbbz.medium.com/guitarix-the-pi-dle-board-8d6298ca8e42)
  - Oficial documentation of Web Audio API: [https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
  - Oficial documentation of Web MIDI API: [https://www.w3.org/TR/webmidi/](https://www.w3.org/TR/webmidi/)
