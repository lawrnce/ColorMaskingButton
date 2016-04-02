//
//  MaskedView.swift
//  Pods
//
//  Created by Lawrence Tran on 4/1/16.
//
//

import UIKit

public enum MaskingDirection {
    case LeftToRight
    case RightToLeft
    case TopToBottom
    case BottomToTop
}

class MaskedView: UIView {

    var direction: MaskingDirection!
    var path: CGPath!
    var animatedView: UIView!
    var layerMask: CAShapeLayer!

    private var size: CGSize!
    
    convenience init(path: CGPath, withDirection direction: MaskingDirection) {
        // Set path for shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        
        // Get bounding box and center
        let boudningBox = CGPathGetBoundingBox(shapeLayer.path)
        shapeLayer.bounds = boudningBox
        shapeLayer.position = CGPointMake(boudningBox.size.width * 0.5, boudningBox.size.height * 0.5)
        let size = boudningBox.size
        
        // set frame to size of shape bounding box
        self.init(frame: CGRectMake(0, 0, size.width, size.height))
        self.layerMask = shapeLayer
        self.animatedView = UIView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
        self.animatedView.center = self.center
        self.direction = direction
        self.path = path
        self.userInteractionEnabled = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.animatedView)
        self.layer.mask = self.layerMask
    }
    
    func revertAnimatingView() {
        self.animatedView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.animatedView.center = self.center
        setNeedsLayout()
    }
    
    func setOffset(targetFrame: CGRect) {
        
        switch (self.direction!) {
        case .LeftToRight:
            let targetOffset = targetFrame.origin.x + targetFrame.width
            let normalizedOffset = targetOffset - self.superview!.frame.origin.x
           
            if normalizedOffset >= 0 && normalizedOffset <= self.frame.width {
                self.animatedView.frame.origin.x = normalizedOffset
                setNeedsLayout()
            } else if normalizedOffset < 0 {
                self.animatedView.frame.origin.x = 0.0
            } else if normalizedOffset > self.frame.width {
                self.animatedView.frame.origin.x = self.frame.width
            }
            
        case .RightToLeft:
            let targetOffset = targetFrame.origin.x
            let superviewFrameOffset = self.superview!.frame.origin.x + self.superview!.frame.width
            let normalizedOffset = superviewFrameOffset - targetOffset
            
            if normalizedOffset >= 0 && normalizedOffset <= self.frame.width {
                self.animatedView.frame.origin.x = -normalizedOffset
                setNeedsLayout()
            } else if normalizedOffset < 0 {
                self.animatedView.frame.origin.x = 0.0
            } else if normalizedOffset > self.frame.width {
                self.animatedView.frame.origin.x = -self.frame.width
            }
            
        case .TopToBottom:
            let targetOffset = targetFrame.origin.y + targetFrame.height
            let normalizedOffset = targetOffset - self.superview!.frame.origin.y
            
            if normalizedOffset >= 0 && normalizedOffset <= self.frame.height {
                self.animatedView.frame.origin.y = normalizedOffset
                setNeedsLayout()
            } else if normalizedOffset < 0 {
                self.animatedView.frame.origin.y = 0.0
            } else if normalizedOffset > self.frame.height {
                self.animatedView.frame.origin.y = self.frame.height
            }
            
        case .BottomToTop:
            let targetOffset = targetFrame.origin.y
            let superviewFrameOffset = self.superview!.frame.origin.y + self.superview!.frame.height
            let normalizedOffset = superviewFrameOffset - targetOffset
            
            if normalizedOffset >= 0 && normalizedOffset <= self.frame.height {
                self.animatedView.frame.origin.y = -normalizedOffset
                setNeedsLayout()
            } else if normalizedOffset < 0 {
                self.animatedView.frame.origin.y = 0.0
            } else if normalizedOffset > self.frame.height {
                self.animatedView.frame.origin.y = -self.frame.height
            }
        }
    }
}