#ifndef AUDIO_CAPTURE_H
#define AUDIO_CAPTURE_H

#include "portaudio.h"
#include <godot_cpp/classes/audio_stream_player.hpp>
#include <godot_cpp/classes/audio_stream_generator_playback.hpp>
#include <godot_cpp/classes/audio_stream_generator.hpp>
#include <godot_cpp/variant/packed_vector2_array.hpp>

using namespace godot;

class AudioCapture : public AudioStreamPlayer
{
    GDCLASS(AudioCapture, AudioStreamPlayer );
public:
    void _init();
    void _ready();
    void _process();
    void _exit_tree();

protected:
    static void _bind_methods(){};
public:
    PaError err;
    int numDevices;
    const PaDeviceInfo* deviceInfo;
    PaStreamParameters inputParameters;
    PaStream* stream;
    Ref<AudioStreamGeneratorPlayback> audio_stream;
    AudioStreamGenerator* audio_generator;
    Ref<AudioStreamGenerator> audio_stream_ref;
    const PaStreamInfo *streamInfo ;
    PackedVector2Array buffer;
};

#endif // TEST_H
