import Flutter
import UIKit

public class SwiftModularPermissionMicrophonePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "modular_permission_microphone", binaryMessenger: registrar.messenger())
    let instance = SwiftModularPermissionMicrophonePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
