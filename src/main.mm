#include <Geode/loader/Mod.hpp>
#include <Geode/loader/SettingV3.hpp>
#include <AVFoundation/AVAudioSession.h>

using namespace geode::prelude;

$execute {
    listenForSettingChanges("enable-mod", [](bool enabled) {
        if (enabled) {
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        }
        else {
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
        }
    });
}

$on_mod(Loaded) {
    auto enabled = Mod::get()->getSettingValue<bool>("enable-mod");
    if (enabled) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
    else {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    }
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
};
