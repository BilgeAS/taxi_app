import Flutter
import UIKit
import GoogleMaps // Make sure this line exists

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Add this line with your key:
      GMSServices.provideAPIKey("AIzaSyAOJtMeKdyPm2z083yGT78nAj1lfzPdtmM")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
