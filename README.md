# Gabriel's Star
A cross-platform mobile support application for parents/families facing a berevement of losing a baby.
Supports both iOS and Android.
Min iOS version 18.2, Min Android version 12.

Built in loving memory of my son, Gabriel Ray Mowbray - 19/09/2024

## Build Tools
This project is built using:
Flutter v3.29.1
VS Code v1.98.0
Android Studio v2024.2
iOS SDK 18.2
Android SDK 35.0.0

## Dependancies
The following dependancies are required:
  cupertino_icons: v1.0.8
  firebase_core: v3.12.1
  firebase_auth: v5.5.1
  url_launcher: v6.2.5

Run flutter pub get from the terminal and they should download and install as they are already definined in pubspec.yaml


## How to Use?
You must run from main.dart
Ensure you have either an iOS or Android device connected or you have an appropriate emulator running. 

Testing has been performed with iPhone 16 emulators and Google Pixel emulators.

## Known bugs
Some ways of going about things are deprecated and need updating in a future version
For example, .withOpacity. This needs updating to .withValues(). 
However it functions as is.

If you run it on a tablet, the home screen is not correctly formatting.
It is however, still all there - simply scroll as if you're scrolling down a wesbite and the options you'd usually see on a phone are there. This is to be fixed in the next version.
