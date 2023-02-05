# disable_screen_touch

A new Flutter project to disable the screen touch in an android phone.
One cannot disable the touch screen in a Flutter app. Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. It does not have the ability to control the system-level touch screen settings of an Android device.

The touch screen is a hardware component, and its behavior is controlled by the operating system. As a developer, you do not have direct access to control the touch screen, and any attempt to do so would likely be blocked by the system for security reasons.

In some cases, you can simulate the effect of disabling the touch screen by making your app consume all touch events or by adding an overlay to the screen that blocks touches, but these methods will not actually disable the touch screen and the user will still be able to interact with the underlying system using other inputs.

In Flutter, you can create an overlay on top of the screen to simulate the effect of a disabled touch screen, but you cannot actually disable the touch screen hardware.
However, this overlay will only affect the user's interaction within your Flutter app and will not prevent the user from interacting with the system using other inputs, such as physical buttons or voice commands. Additionally, your Flutter app does not have access to control the touch screen hardware, so it cannot truly disable the touch screen.

This is a project where a Flutter app with a button creates an overlay on top of the screen to simulate the effect of a disabled touch screen.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
