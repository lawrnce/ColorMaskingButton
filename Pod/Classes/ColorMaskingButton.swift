//
//  ColorMaskingButton.swift
//  Pods
//
//  Created by Lawrence Tran on 4/1/16.
//
//

import UIKit

public class ColorMaskingButton: UIButton {

    private var maskedView: MaskedView!
    
    convenience init(frame: CGRect, withSVG name: String, withForegroundColor foregroundColor: UIColor, withBackgroundColor backgroundColor: UIColor) {
        self.init(frame: frame)
        self.maskedView = MaskedView(SVGname: name)
        self.maskedView.backgroundColor = backgroundColor
        self.maskedView.animatedView.backgroundColor = foregroundColor
    }
    
    convenience init(path: CGPath, withForegroundColor foregroundColor: UIColor, withBackgroundColor backgroundColor: UIColor) {
        self.init(frame: CGRectZero)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.maskedView.center = CGPointMake(self.frame.width / 2.0, self.frame.height / 2.0)
        self.addSubview(self.maskedView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMaskWithSVGName(name: String) {
        let animatedViewFrame = self.maskedView.animatedView.frame
        let backgroundColor = self.maskedView.backgroundColor
        let foregroundColor = self.maskedView.animatedView.backgroundColor
        self.maskedView.removeFromSuperview()
        self.maskedView = MaskedView(SVGname: name)
        self.maskedView.backgroundColor = backgroundColor
        self.maskedView.animatedView.backgroundColor = foregroundColor
        self.maskedView.animatedView.frame = animatedViewFrame
        layoutSubviews()
    }
    
    func change(foregroundColor: UIColor, andBackgroundColor backgroundColor: UIColor) {
        self.maskedView.backgroundColor = backgroundColor
        self.maskedView.animatedView.backgroundColor = foregroundColor
    }
    
    func resetColor(){
        self.maskedView.revertAnimatingView()
    }
    
    func updateColorOffest(targetOffset: CGFloat) {
        
        let normalizedOffest = targetOffset - self.frame.origin.x
        self.maskedView.setFillOffset(normalizedOffest)
        
    }
}
