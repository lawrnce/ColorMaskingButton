//
//  ColorMaskingButton.swift
//  Pods
//
//  Created by Lawrence Tran on 4/1/16.
//
//

import UIKit

public class ColorMaskingButton: UIButton {
    
    // MARK: - PUBLIC VARIABLES
    
    //  Set the increment for the mask according to the increment of your animation.
    //  Default the increment will be set.
    //
    public var increment: CGFloat!
    
    // MARK: - PUBLIC METHODS
    
    //  Basic instantiation with a CGPath of the mask. Foreground color denotes the initial color inside the mask.
    //  Note that Color Masking Button will readjust its frame size to fit the given CGPath. Setting the frame will
    //  only effect the origin of the button.
    convenience public init(frame: CGRect, withPath path: CGPath, withDirection direction: MaskingDirection, withForegroundColor foregroundColor: UIColor, withBackgroundColor backgroundColor: UIColor) {
        self.init(frame: frame)
        self.maskedView = MaskedView(path: path, withDirection: direction)
        self.maskedView.backgroundColor = backgroundColor
        self.maskedView.animatedView.backgroundColor = foregroundColor
    }

    //  Change the color of either the foreground or the background.
    //
    //
    public func change(foregroundColor: UIColor?, andBackgroundColor backgroundColor: UIColor?) {
        if foregroundColor != nil {
            self.maskedView.animatedView.backgroundColor = foregroundColor
        }
        if backgroundColor != nil {
            self.maskedView.backgroundColor = backgroundColor
        }
    }
    
    //  Resets the color mask.
    //
    //
    public func resetColorMask(){
        self.maskedView.revertAnimatingView()
    }
    
    //  Updates the offset according to the direction
    //
    //
    public func updateColorOffest(targetOffset: CGFloat) {
        let normalizedOffest = targetOffset - self.frame.origin.x
        self.maskedView.setFillOffset(normalizedOffest)
    }
    
    //
    //
    //
    public func setMaskWithPath(path: CGPath) {
        let animatedViewFrame = self.maskedView.animatedView.frame
        let backgroundColor = self.maskedView.backgroundColor
        let foregroundColor = self.maskedView.animatedView.backgroundColor
        let direction = self.maskedView.direction
        self.maskedView.removeFromSuperview()
        self.maskedView = MaskedView(path: path, withDirection: direction)
        self.maskedView.backgroundColor = backgroundColor
        self.maskedView.animatedView.backgroundColor = foregroundColor
        self.maskedView.animatedView.frame = animatedViewFrame
        layoutSubviews()
    }
    
    // MARK: - PRIVATE VARIABLES
    
    //
    //
    //
    private var maskedView: MaskedView!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.maskedView.center = CGPointMake(self.frame.width / 2.0, self.frame.height / 2.0)
        self.addSubview(self.maskedView)
        self.sizeToFit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
