#import "Muted.h"
#import <Cordova/CDV.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation Muted

- (void)isMuted:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    bool isMuted = false;

    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        if([[AVAudioSession sharedInstance] outputVolume] < 0.1) {
            isMuted = true;
        }
    }

    MPVolumeView *slide = [MPVolumeView new];
    UISlider *volumeViewSlider = nil;

    for (UIView *view in [slide subviews]){
        if ([[[view class] description] isEqualToString:@"MPVolumeSlider"]) {
            volumeViewSlider = (UISlider *) view;
        }
    }

    if (volumeViewSlider) {
        if([volumeViewSlider value] < 0.1) {
            isMuted = true;
        }
    }

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isMuted];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
