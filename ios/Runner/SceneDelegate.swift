import UIKit
import Flutter
import GoogleMaps // Make sure this line exists

@main
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    // Access FlutterEngine initialized in AppDelegate
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    if let flutterEngine = appDelegate?.flutterEngine {
      let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
      window = UIWindow(windowScene: windowScene)
      window?.rootViewController = flutterViewController
      window?.makeKeyAndVisible()
      return
    }

    // Fallback: create a temporary engine if AppDelegate doesn't have one
    let engine = FlutterEngine(name: "secondary_engine")
    engine.run()
    GeneratedPluginRegistrant.register(with: engine)
    let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = flutterVC
    window?.makeKeyAndVisible()
  }
}
