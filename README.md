# IoT.SE.Opt.T - Pedalboard Virtual para Guitarras (Virtual guitar pedal board)

## Project Overview:

The Virtual Guitar Pedalboard was developed to meet the need to provide guitarists with a practical and versatile solution to experiment with and create sound effects, eliminating the dependence on bulky and expensive physical equipment. With this virtual pedalboard, musicians have the freedom to explore a wide range of guitar effects directly on their computers. This simplifies and enriches the process of composing, practicing, and recording music, allowing guitarists to adjust and customize their sounds intuitively and efficiently. Additionally, the virtual pedalboard provides an ideal environment for testing new ideas and effect configurations, helping to inspire musical creativity.

## Motivation for the Project

The Virtual Guitar Pedalboard was born out of the need to provide guitarists with an innovative and affordable solution to explore and create high-quality sound effects without relying on expensive and bulky physical equipment. Guitarists, whether beginners or professionals, often face challenges when trying to find and combine various pedals and equipment to achieve desired sounds. This not only demands a significant financial investment but can also be logistically complicated, especially during travel or live performances.

With the Virtual Guitar Pedalboard, we aim to solve these problems by offering a digital platform that allows musicians to access a wide range of guitar effects directly from their computers. Our solution simplifies the process of composing, practicing, and recording, allowing guitarists to adjust and customize their sounds with ease and precision. Additionally, the virtual pedalboard is ideal for experimentation, encouraging musical creativity and innovation. Guitarists can test new effect combinations and settings without physical limitations, helping them discover new sounds and styles.

In summary, the motivation to create the Virtual Guitar Pedalboard is to provide musicians with a powerful, flexible, and affordable tool that enhances their skills and expands their creative possibilities, all while eliminating the barriers imposed by traditional equipment.

## Objectives of the Project

- Provide a Complete and Intuitive Experience:
  - Develop a virtual application that offers a complete and intuitive guitar pedalboard experience, allowing users to navigate and easily use the various features and effects available.

- Variety of Sound Effects:
  - Allow users to experience a wide range of sound effects, including distortion, delay, reverb, chorus, among others, enabling the creation of unique and customized sounds for each musical style.

- Creation and Customization of Presets:
  - Facilitate the creation and customization of effect presets, allowing guitarists to adjust parameters according to different musical styles and individual preferences, storing settings for easy access and reuse.

- Advanced Features:
  - Integrate advanced features, such as amplifier simulations and cabinet modeling, providing a more authentic and realistic sound experience that approaches traditional physical equipment.

- Flexible and Open-Source Platform:
  - Provide a flexible and open-source platform that allows for future expansions and collaborations from the community of musicians and developers, encouraging continuous innovation and software improvement through community contributions.

## Architecture and Communication Protocols

The Virtual Guitar Pedalboard uses an architecture based on WebSocket communication, allowing efficient and real-time interaction between the user and the system. Below, we describe the main components and the operation flow of the project:

- Guitar Connection to the Computer:
  - The user connects the guitar to an audio interface device, known as Guitar Link, which is connected to the computer. The Guitar Link converts the guitar's analog signal into a digital format that can be processed by the application.
    
 <img src="Images/Guitarlink.png" alt="Architecture">

| **Features**                                                                                             | **Description**                                                                                                                                                          |
|---------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Additional Output                                                                                               | P10 for stereo headphone or for monitoring with active speakers (boxes).                                                                             |
| Compatibility                                                                                               | Works directly with PC or MAC, comes with installation CD.                                                                                                      |
| Durability                                                                                                  | High-quality components that guarantee durability.                                                                                                           |
| USB Power                                                                                               | USB port does not require external power.                                                                                                                      |
| Installation                                                                                                    | Easy installation (PLUG and PLAY).                                                                                                                                    |
| USB Interface                                                                                                | Guitar Link is a USB interface device that allows you to easily connect your guitar to your PC for professional amplification, recording, and editing work.  |
| Effects                                                                                                       | Use of classic effects in studio as well as on stage.                                                                                                              |
| Recording and Editing                                                                                            | Digital recording and high-quality editing.                                                                                                                          |
| File Playback                                                                                       | Playback of MP3, WAV, AIFF files.                                                                                                                               |
| Operating System Compatibility                                                                    | Compatible with Mac OS and Windows XP/Vista/7/8.                                                                                                                        |
| Real-time Playback                                                                                      | Real-time playback without latency/delay.                                                                                                           |
| Audio Quality                                                                                           | Stereo sound for headphones, audio quality 16-bit, 44.1/48kHz.                                                                                              |


- Audio Library and Processing Engine:
  - On the computer, a dedicated audio library receives the guitar's digital signal. This library is responsible for capturing and preparing the audio for processing. Then, the audio effects engine comes into action, ready to apply the effects selected by the user.

- Client Application on Mobile:
  - The user interacts with the Virtual Pedalboard through a client application on their mobile device. This application provides an intuitive interface for selecting, configuring, and adjusting desired effects.

- Communication via WebSocket:
  - The client application on the mobile device communicates with the server on the computer using WebSockets. This technology allows for bidirectional real-time communication, essential to ensure that effect changes made by the user are applied instantly.

- Application of Effects:
  - When the user selects and configures the effects in the mobile application, these settings are sent to the server via WebSocket. The server, in turn, applies the received effects to the guitar audio in real-time, using the audio processing engine.

- Processed Audio Feedback:
  - After the application of effects, the processed audio is returned to the client. The user then hears the guitar sound with the effects applied directly on their device, allowing for immediate feedback and a continuous, latency-free user experience.

<img src="Images/architecture.png" alt="Architecture">

### Architecture Benefits
- Real-time Interactivity: WebSocket communication ensures that changes made in the client application are immediately reflected in the processed audio.
- Flexibility and Customization: Users can customize a wide range of effects directly from their mobile devices, adjusting parameters in real-time according to their needs and preferences.
- Simple Integration: The use of a Guitar Link simplifies the connection of the guitar to the system, making the setup accessible for both beginners and professionals.
- Authentic Experience: The audio processing engine on the computer applies effects with high fidelity, providing an authentic sound experience that approaches the use of traditional physical equipment.

This modern and efficient architecture not only meets the practical needs of guitarists but also paves the way for future expansions and improvements, maintaining flexibility and open collaboration as fundamental pillars of the project.

## Dashboard

<img src="Images/D1.png" alt="d1">

- Dashboard Title:
  - The text “START CLIENT SEND TEST PACKET” is at the top of the screen.
- Client Status:
  - Below the title, there is a line that says “CLIENT STATUS CONNECTED ID# 78829240”. This indicates that the client is connected and has a specific ID.
- “ADD EFFECT” Option:
  - At the bottom of the screen, there is a button or option called “ADD EFFECT”. This suggests that the user can add some effect or layer to the application.

<img src="Images/D2.png" alt="d2">
 
After selecting the “ADD EFFECT” option, you will likely see a screen with different types of audio effects to apply to your virtual guitar pedalboard. Here are some possible options that may appear:

- Delay:
  - The delay effect adds repetitions of the guitar sound, creating an echo effect. You can adjust the time between repetitions and the amount of feedback.
- Overdrive:
  - Overdrive is used to add gentle distortion to the guitar sound, giving it a warmer and “grittier” tone.
- Reverb:
  - Reverb simulates the sound of playing in different environments, adding depth and ambiance to the guitar sound.
 
<img src="Images/D3.png" alt="d3">
 
If the “Reverb” option is selected, you can adjust the reverb settings to give the guitar a more spacious and ambient sound. Here are some options you may encounter:

The interface displays two sections related to audio effects:

- Reverb:
  - The “REVERB” section is active, indicating that the reverb effect is being applied.
  - There is an option for “REMOVE EFFECT”, which allows you to deactivate the reverb.
- Room Size:
  - The parameter is set to “0.8” which controls the simulated room size for the reverb effect.

## Time to Make the project by yourself

For information on how to install and configure the apps used in this project, [click here](https://github.com/DimitriMargutti/IoT.SE.Opt.T---Virtual-guitar-pedal-board/blob/main/Instalation_and_configuration/README.md)

## Mentorship

This project was developed with the mentorship of [Dhiego Fernandes](https://github.com/DhiegoFC/IoT_for_Embedded_Devices), a professor at the State University of São Paulo.

## References

- Documentation: related to the project's inspiration:
  - [GDExtension](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/index.html)
  - [Godot Engine](https://godotengine.org)
  - [PortAudio](https://github.com/PortAudio/portaudio)

  
