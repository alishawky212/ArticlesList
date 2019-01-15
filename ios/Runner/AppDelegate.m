#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
@import GoogleMobileAds;
@implementation AppDelegate
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-4790983019049317~4474414942"];
    return YES;
    
}
    
@end
