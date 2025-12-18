import Flutter
import UIKit
import GoogleMaps // Make sure this line exists

@main
@objc class AppDelegate: FlutterAppDelegate {
  var flutterEngine: FlutterEngine?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Keep your Google Maps API key registration
    GMSServices.provideAPIKey("AIzaSyAOJtMeKdyPm2z083yGT78nAj1lfzPdtmM")

    // Initialize a shared FlutterEngine so SceneDelegate can create Flutter views
    flutterEngine = FlutterEngine(name: "my_engine")
    flutterEngine?.run()
    if let engine = flutterEngine {
      GeneratedPluginRegistrant.register(with: engine)
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
