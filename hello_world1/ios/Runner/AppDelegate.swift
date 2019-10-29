import UIKit
import Flutter

enum ChannelName {
  static let hello_world = "flutter.key46.com/hello_world"
}

enum MyFlutterErrorCode {
  static let unavailable = "UNAVAILABLE"
}


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not type FlutterViewController")
    }

    let helloChannel = FlutterMethodChannel(name: ChannelName.hello_world,
                                              binaryMessenger: controller.binaryMessenger)

    helloChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "hello" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.returnHello(call: call, result: result)
    })


    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func returnHello(call: FlutterMethodCall, result: FlutterResult) -> String? {
    let halo = "Hello World"

    guard let args = call.arguments else {
      return ""
    }

    if let myArgs = args as? [String: Any] {
      if let text = myArgs["text"] as? String {
        if(text != nil){
          result(halo + " " + text)
          return halo + " " + text
        }  
      }
    }

    result(halo)
    return halo
  }
}
