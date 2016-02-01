#import "CDVMuted.h"
#import <Cordova/CDV.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@implementation Muted

- (bool)isMuted:(CDVInvokedUrlCommand*)command
{
  if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
      float vol = [[AVAudioSession sharedInstance] outputVolume];

      if(vol < 0.1) {
          return YES;
      }

      return NO;
  }

  MPVolumeView *slide = [MPVolumeView new];
  UISlider *volumeViewSlider = nil;

  for (UIView *view in [slide subviews]){
      if ([[[view class] description] isEqualToString:@"MPVolumeSlider"]) {
          volumeViewSlider = (UISlider *) view;
      }
  }

  if (volumeViewSlider) {
      float val = [volumeViewSlider value];

      if(val < 0.1) {
        return YES;
      }
  }

  return NO;
}

@end