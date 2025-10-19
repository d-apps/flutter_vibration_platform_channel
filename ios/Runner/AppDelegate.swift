import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

  private let channelName = "vibration"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Obtém o FlutterViewController principal
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Cria o canal de comunicação
    let vibrationChannel = FlutterMethodChannel(
      name: channelName,
      binaryMessenger: controller.binaryMessenger
    )

    // Instancia o nosso serviço nativo
    let vibrationService = VibrationService()

    // Trata as chamadas vindas do Flutter
    vibrationChannel.setMethodCallHandler { (call, result) in
      switch call.method {
      case "vibrate":
        if let args = call.arguments as? [String: Any] {
          let amplitude = args["amplitude"] as? Int ?? 128
          vibrationService.triggerVibration(amplitude: amplitude)
          result("Vibration triggered")
        } else {
          result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing args", details: nil))
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    // Continua execução normal do Flutter
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}
