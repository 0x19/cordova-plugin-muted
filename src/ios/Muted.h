#import <Cordova/CDV.h>

@interface Muted : CDVPlugin
- (void)isMuted:(CDVInvokedUrlCommand*)command;
@end


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
