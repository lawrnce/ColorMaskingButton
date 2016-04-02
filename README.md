# Color Masking Button

<p align="center">
<img src="/Assets/preview.gif" />
</p>

[![CI Status](http://img.shields.io/travis/Lawrence Tran/ColorMaskingButton.svg?style=flat)](https://travis-ci.org/Lawrence Tran/ColorMaskingButton)
[![Version](https://img.shields.io/cocoapods/v/ColorMaskingButton.svg?style=flat)](http://cocoapods.org/pods/ColorMaskingButton)
[![License](https://img.shields.io/cocoapods/l/ColorMaskingButton.svg?style=flat)](http://cocoapods.org/pods/ColorMaskingButton)
[![Platform](https://img.shields.io/cocoapods/p/ColorMaskingButton.svg?style=flat)](http://cocoapods.org/pods/ColorMaskingButton)

## Create a Masking Button

Color Masking Button uses a CGPath as its mask. You can create a CGPath from a SVG file with [PocketSVG](https://github.com/arielelkin/PocketSVG). Color Masking Button adjusts its frame to the size of the mask's path. To create different sized buttons, initiate with different sized paths.

```swift
// Create path
let myPath = PocketSVG.pathFromSVGFileNamed("mySVGFile").takeUnretainedValue()

// Set the origin of the frame, and Color Masking Button will adjust its frame
let myColorMaskingButton = ColorMaskingButton(origin: myOrigin, withPath: myPath, withDirection: .LeftToRight, withForegroundColor: color1, withBackgroundColor: color2)
```

## Documentation

```swift
enum MaskingDirection {
case LeftToRight
case RightToLeft
case TopToBottom
case BottomToTop
}
```
Defines the possible directions of the masking effect.

#### Variables

```swift
var direction: MaskingDirection
```
Returns direction of the color mask. (read-only)

```swift
var path: CGPath
```
Returns the path of the color mask. (read-only)

#### Methods

```swift
init(origin: CGPoint, withPath path: CGPath, withDirection direction: MaskingDirection, withForegroundColor foregroundColor: UIColor, withBackgroundColor backgroundColor: UIColor)
```
Basic instantiation with a CGPath of the mask. Foreground color denotes the initial color inside the mask. Note that Color Masking Button will readjust its frame size to fit the given CGPath. 

```swift
func addTarget(target: AnyObject?, action: Selector, forControlEvents controlEvents: UIControlEvents)
```
Add target to a selector. Color Masking Button is a subclass of UIButton.

```swift
func updateColorOffset(targetFrame: CGRect)
```
Updates the mask's offset according to the target view's frame. Note that both the Color Masking Button and the target view must be in the same superview.

```swift
func change(foregroundColor: UIColor?, andBackgroundColor backgroundColor: UIColor?)
```
Change the color of either the foreground or the background.

```swift
func resetColorMask()
```
Force a reset the color mask.

```swift
func setMaskWithPath(path: CGPath)
```
Change the color mask while preseving color and offset.

<p align="center">
<img src="/Assets/changing.gif" />
</p>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Swift 2.0+
* iOS 8.0+

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
