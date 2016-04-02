//
//  ViewController.swift
//  ColorMaskingButton
//
//  Created by Lawrence Tran on 04/01/2016.
//  Copyright (c) 2016 Lawrence Tran. All rights reserved.
//

import UIKit
import PocketSVG
import ColorMaskingButton

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    private var exampleButton: ColorMaskingButton!
    private var exampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupLeftToRight()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Setup each example
    private func setupLeftToRight() {
        reset()
        self.label.text = "Left to Right"
        self.slider.setValue(0.0, animated: false)
        
        let closePath = PocketSVG.pathFromSVGFileNamed("Close").takeUnretainedValue()
        
        self.exampleButton = ColorMaskingButton(frame: CGRectZero, withPath: closePath, withDirection: .LeftToRight, withForegroundColor: UIColor.blackColor(), withBackgroundColor: UIColor.whiteColor())
        self.exampleButton.center = self.view.center
        self.exampleButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        self.exampleView = UIView(frame: CGRect(x: 0,
            y: UIScreen.mainScreen().bounds.height / 4.0,
            width: 0.0, height: UIScreen.mainScreen().bounds.height / 2.0))
        self.exampleView.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(self.exampleView)
        self.view.addSubview(self.exampleButton)
    }
    
    private func setupRightToLeft() {
        reset()
        self.label.text = "Right to Left"
        self.slider.setValue(0.0, animated: false)
    }
    
    private func setupTopToBottom() {
        reset()
        self.label.text = "Top to Bottom"
        self.slider.setValue(0.0, animated: false)
    }
    
    private func setupBottomToTop() {
        reset()
        self.label.text = "Bottom to Top"
        self.slider.setValue(0.0, animated: false)
    }
    
    private func reset() {
        if self.exampleView != nil {
            self.exampleView.removeFromSuperview()
            self.exampleButton.removeFromSuperview()
            self.exampleView = nil
            self.exampleButton = nil
        }
    }
    
    private func layoutButtons() {
        
    }
    
    func buttonPressed(sender: UIButton) {
        print("Button Pressed")
    }

    @IBAction func segmentedControlValueChanged(sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        
        switch (value) {
        case 0:
            setupLeftToRight()
        case 1:
            setupRightToLeft()
        case 2:
            setupTopToBottom()
        case 3:
            setupBottomToTop()
            
        default:
            break
        }
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let value = CGFloat(sender.value)
        
        switch (self.exampleButton.direction!) {
            
        case .LeftToRight:
            self.exampleView.frame.size.width = UIScreen.mainScreen().bounds.width * value
            
        case .RightToLeft:
            break
//            self.exampleView.frame.size.width = UIScreen.mainScreen().bounds.width * value
//            let offset = self.exampleView.frame.origin.x + self.exampleView.frame.width
//            self.exampleButton.updateColorOffest(offset)
            
        case .TopToBottom:
            break
//            self.exampleView.frame.size.width = UIScreen.mainScreen().bounds.width * value
//            let offset = self.exampleView.frame.origin.x + self.exampleView.frame.width
//            self.exampleButton.updateColorOffest(offset)
            
        case .BottomToTop:
            break
//            self.exampleView.frame.size.width = UIScreen.mainScreen().bounds.width * value
//            let offset = self.exampleView.frame.origin.x + self.exampleView.frame.width
//            self.exampleButton.updateColorOffest(offset)
        }
        
         self.exampleButton.updateColorOffset(self.exampleView.frame)
        
    }
}
























