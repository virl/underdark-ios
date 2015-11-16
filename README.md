# Underdark Trial & Examples for iOS
http://underdark.io

Peer-to-peer networking library for iOS and Android, with Wi-Fi and Bluetooth support.

This repository contains sources for examples of using the library and also short “Getting Started” guide below.

## Demo apps
* Android: https://play.google.com/store/apps/details?id=me.solidarity.app
* iOS http://itunes.apple.com/app/id956548749

Video demo: http://www.youtube.com/watch?v=ox4dh0s1XTw

## Author
You can contact me via Telegram at http://telegram.me/virlof or by email at virlof@gmail.com

## License
This library may be used for non-commercial and educational purposes only.
If you want to use it in your products, please contact the author.

## Installation
[ ![Download](https://api.bintray.com/packages/underdark/ios/underdark/images/download.svg) ](https://bintray.com/underdark/ios/underdark/_latestVersion)

To link with Underdark library:

1. Download recent version of Underdark.framework to your project directory (or into "Libraries" in examples): https://bintray.com/underdark/ios/underdark/
2. Add Underdark.framework to “Embedded binaries” and “Linked Frameworks and Libraries” in your project target’s settings in Xcode.
3. When using framework's classes, import them with ```@import Underdark;``` in Objective-C or ```import Underdark``` in Swift.

## Getting started
Underdark API is very simple — it consists of entry class `UDUnderdark` with method `configureTransport*` — it allows you to create `UDTransport` instance with desired parameters (like network interface type) and specify UDTransportDelegate implementation for callbacks.

Full documentation resides in appledoc of Underdark.framework, starting from `UDUnderdark` class.
