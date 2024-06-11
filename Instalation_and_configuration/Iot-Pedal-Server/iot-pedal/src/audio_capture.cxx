#include "audio_capture.h"

#include<godot_cpp/variant/utility_functions.hpp>

#define SAMPLE_RATE 44100
#define FRAMES_PER_BUFFER 64
#define PA_MIN_LATENCY_MSEC 10


static void checkErr(PaError err){
    if(err != paNoError)
    {
        UtilityFunctions::print("Port audio error: ", Pa_GetErrorText(err));
    }
}

static inline float max(float a, float b)
{
    return a > b ? a : b;
}

static int inputCallback(
    const void* inputBuffer, void* outputBuffer, unsigned long framesPerBuffer,
    const PaStreamCallbackTimeInfo* timeInfo, PaStreamCallbackFlags statusFlag,
    void* userData
)
{
    float* in = (float*) inputBuffer;
    (void)outputBuffer;
    AudioCapture* self = (AudioCapture*)userData;

    self->buffer.resize(framesPerBuffer);

    for (int i = 0; i < framesPerBuffer; i++) {
        // Defina diretamente os valores x e y no PackedVector2Array
        self->buffer[i].x = in[i];
        self->buffer[i].y = in[i];
    }

    // Empurre o quadro para o stream de áudio
    for (int i = 0; i < framesPerBuffer; i++) {
        self->audio_stream->push_frame(self->buffer[i]);
    }

    return paContinue;
}

void AudioCapture::_init() {
    stream = nullptr;
    audio_generator = nullptr;
}

void AudioCapture::_ready(){
    audio_generator = new AudioStreamGenerator();
    audio_generator->set_buffer_length(0.03);
    audio_stream_ref = Ref<AudioStreamGenerator>(audio_generator);
    set_stream(audio_stream_ref);

    this->play();

    audio_stream = Ref<AudioStreamGeneratorPlayback>(this->get_stream_playback().ptr());

    PaError err;
    err = Pa_Initialize();
    checkErr(err);

    numDevices = Pa_GetDeviceCount();
    UtilityFunctions::print("Number of devices: ", numDevices);

     if (numDevices < 0)
    {
        UtilityFunctions::print("error getting devices");
    }
    else if (numDevices == 0)
    {
        UtilityFunctions::print("no devices available");
    }

    for(int i = 0; i < numDevices; i++)
    {
        deviceInfo = Pa_GetDeviceInfo(i);
        UtilityFunctions::print("Device: ", i);
        UtilityFunctions::print("  name: ",deviceInfo->name);
        UtilityFunctions::print("  maxInputChannels: ",deviceInfo->maxInputChannels);
        UtilityFunctions::print("  maxOutputChannels: ",deviceInfo->maxOutputChannels);
        UtilityFunctions::print("  defaultSampleRate: ", deviceInfo->defaultSampleRate);
        UtilityFunctions::print("  defaultLowInputLatency: ", deviceInfo->defaultLowInputLatency * 1000.0);
    }

    int device = 1; //device index pulse

    memset(&inputParameters, 0, sizeof(inputParameters));
    inputParameters.channelCount = 1; //mono
    inputParameters.device = device; //device utilizado
    inputParameters.hostApiSpecificStreamInfo = NULL;
    inputParameters.sampleFormat = paFloat32;
    inputParameters.suggestedLatency = Pa_GetDeviceInfo(device)->defaultLowInputLatency;
    //inputParameters.suggestedLatency = PA_MIN_LATENCY_MSEC/1000.0;


    err = Pa_OpenStream(
        &stream,
        &inputParameters,
        NULL,
        SAMPLE_RATE,
        FRAMES_PER_BUFFER,
        paNoFlag,
        inputCallback,
        this
    );
    checkErr(err);

    err = Pa_StartStream(stream);
    checkErr(err);

    // Obter informações do stream
    streamInfo = Pa_GetStreamInfo(stream);
    if (streamInfo != NULL) {
        UtilityFunctions::print("Latência de entrada: ms\n", streamInfo->inputLatency * 1000);
        UtilityFunctions::print("Latência de saída: ms\n", streamInfo->outputLatency * 1000);
    }
}

void AudioCapture::_exit_tree()
{
    err = Pa_StopStream(stream);
    checkErr(err);

    err = Pa_CloseStream(stream);
    checkErr(err);

    err = Pa_Terminate();
    checkErr(err);
}

void AudioCapture::_process()
{

}
