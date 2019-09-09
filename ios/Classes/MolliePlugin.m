#import "MolliePlugin.h"
#import <mollie/mollie-Swift.h>

@implementation MolliePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMolliePlugin registerWithRegistrar:registrar];
}
@end
