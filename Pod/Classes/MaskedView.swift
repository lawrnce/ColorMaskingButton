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

    var animatedView: UIView!
    var layerMask: CAShapeLayer!
    var direction: MaskingDirection!
    
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
        self.animatedView = UIView(frame: CGRectMake(0, 0, self.frame.width * 2.0, self.frame.height * 2.0))
        self.direction = direction
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
        self.animatedView.frame = CGRectMake(0, 0, self.frame.width * 2.0, self.frame.height * 2.0)
        setNeedsLayout()
    }
    
    func setFillOffset(targetOffset: CGFloat) {
        let normalizedOffest = targetOffset - self.frame.origin.x
        if normalizedOffest >= 0 && normalizedOffest <= self.frame.width {
            
            switch (self.direction!) {
                
            case .LeftToRight:
                self.animatedView.frame.origin.x = normalizedOffest
              
            case .RightToLeft:
                self.animatedView.frame.origin.x = normalizedOffest + self.animatedView.frame.width
               
            case .TopToBottom:
                self.animatedView.frame.origin.y = normalizedOffest
          
            case .BottomToTop:
                self.animatedView.frame.origin.x = normalizedOffest + self.animatedView.frame.height
            }
            
            setNeedsLayout()
        }
    }
}



















