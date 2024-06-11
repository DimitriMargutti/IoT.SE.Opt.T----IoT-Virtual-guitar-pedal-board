## Tutorial: Running the Virtual Pedalboard with Godot and PortAudio

### Prerequisites:
1. Godot Engine installed on your computer.
2. Basic knowledge of Godot and programming.
3. PortAudio installed on your computer.

### Steps:

1. **Download the Source Code:**
   - Download the source code of the virtual pedalboard from your GitHub repository.

2. **Install PortAudio:**
   - Make sure you have PortAudio installed on your computer. You can download and install it from the [official PortAudio website](http://www.portaudio.com/download.html).

3. **Open the Project in Godot:**
   - Open the Godot Engine and load the project of the virtual pedalboard that you downloaded from GitHub.

4. **Configure Project Dependencies:**
   - Ensure that Godot is configured to use PortAudio as the default audio library for exporting the project. This can be done in the project settings in Godot.

5. **Run the Server:**
   - In Godot, open the script that defines the WebSocket server and ensure that the settings are correct, such as the IP address and port for connection. Save the changes and run the server.

6. **Build and Run the Client on Mobile:**
   - Export the Godot project for the desired mobile platform (Android or iOS) and build the application.
   - Install the application on your mobile device and run it.

7. **Connect the Guitar to the Guitar Link:**
   - Connect your guitar to a Guitar Link device, which is then connected to your computer.

8. **Select and Configure Effects on the Mobile:**
   - In the mobile application, select the desired effects and configure them to your preference.

9. **Communicate with the Server:**
   - The mobile application will communicate with the WebSocket server on the computer, sending the selected effect settings.

10. **Application of Effects on the Server:**
    - The server will receive the effect settings and apply them to the audio received from the guitar using the PortAudio library.

11. **Return of Processed Audio to the Client:**
    - The processed audio, with the effects applied, will be sent back to the client (mobile application) via WebSocket.

12. **Enjoy the Audio with Applied Effects:**
    - In the mobile application, you will be able to hear the guitar audio with the applied effects in real-time.

