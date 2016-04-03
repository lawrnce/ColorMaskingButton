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
    
    //  Returns direction of the color mask. (read-only)
    //
    //
    public var direction: MaskingDirection!{
        get {
            return self.maskedView.direction
        }
    }
    
    //  Returns the path of the color mask. (read-only)
    //
    //
    public var path: CGPath! {
        get {
            return self.maskedView.path
        }
    }
    
    // MARK: - PUBLIC METHODS
    
    //  Basic instantiation with a CGPath of the mask. Foreground color denotes the initial color inside the mask.
    //  Note that Color Masking Button will readjust its frame size to fit the given CGPath. 
    //
    convenience public init(origin: CGPoint, withPath path: CGPath, withDirection direction: MaskingDirection, withForegroundColor foregroundColor: UIColor, withBackgroundColor backgroundColor: UIColor) {
        self.init(frame: CGRect(origin: origin, size: CGSizeZero))
        self.maskedView = MaskedView(path: path, withDirection: direction)
        self.maskedView.backgroundColor = backgroundColor
        self.maskedView.animatedView.backgroundColor = foregroundColor
        self.layoutSubviews()
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
    public func updateColorOffset(targetFrame: CGRect) {
        self.maskedView.setOffset(targetFrame)
    }
    
    //  Change the CGPath.
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
    
    //  Masked View handles the animation masking.
    //
    //
    private var maskedView: MaskedView!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.maskedView.center = CGPointMake(self.frame.width / 2.0, self.frame.height / 2.0)
        self.addSubview(self.maskedView)
        self.frame.size = self.maskedView.bounds.size
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
