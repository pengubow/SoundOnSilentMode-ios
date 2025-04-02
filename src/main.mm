#include <Geode/loader/Mod.hpp>
#include <AVFoundation/AVAudioSession.h>

$on_mod(Loaded) {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil]; 
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
};
