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
- Pi 4:

<img src="Images/Pi4.png" alt="Components" width="600" height="600">
<img src="Images/EspecificationPI4.png" alt="Components" width="600" height="400">
 
- Connectors:
    - Input Jack, 1/4 inch unbalanced, Zin=0.5MΩ.
    - Output Jack, 1/4 inch unbalanced, Zout=100Ω.
    - Power supply: power taken from the Pi 4 board (micro-USB).

<img src="Images/Components.png" alt="Components" width="600" height="600">

### Operation strategy 

- The Input Stage: Amplifies and filters the guitar signal making it ready for the ADC (Analog to Digital Converter). The ADC sends the signal to the PI 4 using SPI communication.
  
- Pi 4: It takes the digitalized audio waveform from the ADC and does all the Digital Signal Processing (DSP) creating effects (distortion, fuzz, delay, echo, tremolo...) that, in turn, must be pre-selected from the dashboard in the user's mobile application. From the user's selection, the application establishes communication with the board through MQTT.
  
- The Output Stage: Once the new digital waveform is created, the Pi 4 creates an analog signal with two PWMs combined, the signal is filtered and prepared to be sent to the next pedal or the guitar amp.
  
Therefore, the operation can be represented by the following image:

<img src="Images/pedal-pi-dsp1.png" alt="Operation" width="" height="">

### Application and Dashboard

For the creation of the application, it is intended to use the Godot software, widely used for game development, thus enabling an intuitive and functional application. It is intended to create a user login system, so that it is possible to save musical styles and pedal profiles, allowing greater customization by the user.

The following image serves as a login screen concept:

<img src="Images/loginScreenConceptualImage.jpg" alt="Login screen" width="600" height="400">

And the following image serves as inspiration for the creation of the dashboard:

<img src="Images/DashboardInspiration.png" alt="Dashboard" width="" height="">

## Installation and Configuration Manual

### Installation and use of NodeRed

#### Using local installation

- Make sure you have Node.js installed on your system. If not, you can download and install it from the official website: nodejs.org.
- Open a terminal or command prompt and run the following command to install Node-RED globally:
- "npm install -g --unsafe-perm node-red"

#### Using Docker

- If you prefer, you can also use Docker to run Node-RED:
- Make sure you have Docker installed on your system.
- Run the following command to download and run the Node-RED image:
- "docker run -it -p 1880:1880 --name mynodered nodered/node-red"

#### Starting the Node-RED Server:

- After installing Node-RED, you can start the server by running the following command in the terminal:
- "node-red"
- If you're using Docker, the Node-RED server will already be running after the docker run command.

#### Accessing the Node-RED Web Interface:
- Open a web browser and go to the following address:
- "http://localhost:1880"
- If you're running Node-RED on a remote machine, replace localhost with the IP address of the machine.

#### Creating and Editing Flows:

- In the Node-RED interface, you'll see a visual development environment where you can create and edit flows.

- Adding Nodes: Drag and drop nodes from the sidebar to the workspace. There are nodes for interacting with physical devices, web services, databases, and more.
- Connecting Nodes: Connect nodes by dragging a line between input and output ports. This defines the flow of data between nodes.
- Configuring Nodes: Double-click on a node to open its settings. Here you can enter information such as IP addresses, API keys, and other relevant options.
Debugging and Testing: Use the built-in debugging feature to monitor the flow of data and verify that everything is working as expected.

#### Deploying the Flow:

- When you're satisfied with your flow, click the "Deploy" button in the top-right corner of the interface. This will save your changes and deploy the flow for execution.

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
