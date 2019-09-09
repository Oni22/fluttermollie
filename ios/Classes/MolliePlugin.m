#import "MolliePlugin.h"

@interface MolliePlugin ()
@property (nonatomic, strong) UIViewController *viewController;
@end

@implementation MolliePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {

  FlutterMethodChannel* channel = [FlutterMethodChannel
                                       methodChannelWithName:@"mollie"
                                       binaryMessenger:[registrar messenger]];

  UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
  MolliePlugin *instance = [[MolliePlugin alloc] initWithViewController:viewController];
  [registrar addMethodCallDelegate:instance channel:channel];

}

- (instancetype)initWithViewController:(UIViewController *)viewController {
    self = [super init];

    if (self) {
        _viewController = viewController;
    }

    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([@"startPayment" isEqualToString:call.method]) {

        NSString *checkoutUrl = call.arguments[@"checkoutUrl"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: checkoutUrl]];

    }
    else
    {
        result(FlutterMethodNotImplemented);
    }
}

@end
