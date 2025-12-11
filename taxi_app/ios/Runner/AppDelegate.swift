import Flutter
import UIKit
import GoogleMaps // Husk å importere GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  
  ) -> Bool {
    // Legg til denne linjen med din faktiske API-nøkkel
    GMSServices.provideAPIKey("AIzaSyBfZS_M_ft3teL25mJfr27s9WmBxi7RgOE") 

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
