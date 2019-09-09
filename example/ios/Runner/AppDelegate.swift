import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey :   Any] = [:]) -> Bool {
        if (url.host! == "payment-return") {
            
            let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
            controller.pushRoute("done");
            
            return true;
        }
        
        return false;
    }
}
