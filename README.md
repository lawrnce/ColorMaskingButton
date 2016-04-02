# Color Masking Button

<p align="center">
<img src="/Assets/preview.gif" />
</p>

[![CI Status](http://img.shields.io/travis/Lawrence Tran/ColorMaskingButton.svg?style=flat)](https://travis-ci.org/Lawrence Tran/ColorMaskingButton)
[![Version](https://img.shields.io/cocoapods/v/ColorMaskingButton.svg?style=flat)](http://cocoapods.org/pods/ColorMaskingButton)
[![License](https://img.shields.io/cocoapods/l/ColorMaskingButton.svg?style=flat)](http://cocoapods.org/pods/ColorMaskingButton)
[![Platform](https://img.shields.io/cocoapods/p/ColorMaskingButton.svg?style=flat)](http://cocoapods.org/pods/ColorMaskingButton)

## Create a Masking Button

Color Masking Button takes a CGPath as its mask. You can create a CGPath from a SVG file with [PocketSVG](https://github.com/arielelkin/PocketSVG).

```swift
    let myPath = PocketSVG.pathFromSVGFileNamed("mySVGFile").takeUnretainedValue()
```

Color Masking Button adjusts its frame to the size of the mask's path. To create different sized buttons, initiate with different sized paths.

```swift
    // Set the origin of the frame, and Color Masking Button will adjust its frame
    let myColorMaskingButton = ColorMaskingButton(origin: myOrigin, withPath: myPath, withDirection: .LeftToRight, withForegroundColor: color1, withBackgroundColor: color2)
```

## Documentation

#### Variables

#### Methods

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ColorMaskingButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod "ColorMaskingButton"
```

## Author

Lawrence Tran

## License

ColorMaskingButton is available under the MIT license. See the LICENSE file for more info.
