#import "Echo.h"
#import <Cordova/CDV.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@implementation Muted

- (bool)isMuted:(CDVInvokedUrlCommand*)command
{
  if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
      float vol = [[AVAudioSession sharedInstance] outputVolume];
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

      if(volumeViewSlider < 0.1) {
        return YES;
      }
  }

  return NO;
}

@end
