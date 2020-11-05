#import "ModularPermissionMicrophonePlugin.h"
#if __has_include(<modular_permission_microphone/modular_permission_microphone-Swift.h>)
#import <modular_permission_microphone/modular_permission_microphone-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "modular_permission_microphone-Swift.h"
#endif

@implementation ModularPermissionMicrophonePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftModularPermissionMicrophonePlugin registerWithRegistrar:registrar];
}
@end
