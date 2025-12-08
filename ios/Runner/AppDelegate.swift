import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? // Sadece bu satırı değiştirin
  ) -> Bool {
    // API anahtarınızı tam buraya yapıştırın:
    GMSServices.provideAPIKey("AIzaSyBfZS_M_ft3teL25mJfr27s9WmBxi7RgOE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
