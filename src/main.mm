#include <Geode/Geode.hpp>
#include <Geode/modify/MenuLayer.hpp>
#include <AVFoundation/AVAudioSession.h>
using namespace geode::prelude;

bool activated = false;

class $modify(MenuLayer) {
    bool init() {
        if (!MenuLayer::init()) return false;
        if (!activated) {
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil]; 
            [[AVAudioSession sharedInstance] setActive:YES error:nil];
            activated = true;
        }
        return true;
    }
};
