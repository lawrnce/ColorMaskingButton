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
    
    private var sunOffPath: CGPath!
    private var sunOnPath: CGPath!
    
    private var exampleButton: ColorMaskingButton!
    private var exampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sunOffPath = PocketSVG.pathFromSVGFileNamed("SunOff").takeUnretainedValue()
        self.sunOnPath = PocketSVG.pathFromSVGFileNamed("SunOn").takeUnretainedValue()
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
    
    //  Set left to right masking.
    //
    //
    private func setupLeftToRight() {
        reset()
        self.label.text = "Left to Right"
        self.slider.setValue(0.0, animated: false)
        
        self.exampleButton = ColorMaskingButton(frame: CGRectZero, withPath: self.sunOffPath, withDirection: .LeftToRight, withForegroundColor: UIColor.blackColor(), withBackgroundColor: UIColor.whiteColor())
        self.exampleButton.center = self.view.center
        self.exampleButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        self.exampleView = UIView(frame: CGRect(x: 0,
            y: UIScreen.mainScreen().bounds.height / 4.0,
            width: 0.0, height: UIScreen.mainScreen().bounds.height / 2.0))
        self.exampleView.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(self.exampleView)
        self.view.addSubview(self.exampleButton)
    }
    
    //  Set right to left masking.
    //
    //
    private func setupRightToLeft() {
        reset()
        self.label.text = "Right to Left"
        self.slider.setValue(1.0, animated: false)
        
        self.exampleButton = ColorMaskingButton(frame: CGRectZero, withPath: self.sunOffPath, withDirection: .RightToLeft, withForegroundColor: UIColor.blackColor(), withBackgroundColor: UIColor.whiteColor())
        self.exampleButton.center = self.view.center
        self.exampleButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        self.exampleView = UIView(frame: CGRect(x: UIScreen.mainScreen().bounds.width,
            y: UIScreen.mainScreen().bounds.height / 4.0,
            width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height / 2.0))
        self.exampleView.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(self.exampleView)
        self.view.addSubview(self.exampleButton)
    }
    
    //  Set top to bottom masking.
    //
    //
    private func setupTopToBottom() {
        reset()
        self.label.text = "Top to Bottom"
        self.slider.setValue(0.0, animated: false)
        
        self.exampleButton = ColorMaskingButton(frame: CGRectZero, withPath: self.sunOffPath, withDirection: .TopToBottom, withForegroundColor: UIColor.blackColor(), withBackgroundColor: UIColor.whiteColor())
        self.exampleButton.center = self.view.center
        self.exampleButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        self.exampleView = UIView(frame: CGRect(x: 0,
            y: UIScreen.mainScreen().bounds.height / 4.0,
            width: UIScreen.mainScreen().bounds.width, height: 0.0))
        self.exampleView.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(self.exampleView)
        self.view.addSubview(self.exampleButton)
    }
    
    //  Set bottom to top masking.
    //
    //
    private func setupBottomToTop() {
        reset()
        self.label.text = "Bottom to Top"
        self.slider.setValue(1.0, animated: false)
        
        self.exampleButton = ColorMaskingButton(frame: CGRectZero, withPath: self.sunOffPath, withDirection: .BottomToTop, withForegroundColor: UIColor.blackColor(), withBackgroundColor: UIColor.whiteColor())
        self.exampleButton.center = self.view.center
        self.exampleButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        self.exampleView = UIView(frame: CGRect(x: 0,
            y: UIScreen.mainScreen().bounds.height * 0.75,
            width: UIScreen.mainScreen().bounds.width, height: 0.0))
        self.exampleView.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(self.exampleView)
        self.view.addSubview(self.exampleButton)
    }
    
    private func reset() {
        if self.exampleView != nil {
            self.exampleView.removeFromSuperview()
            self.exampleButton.removeFromSuperview()
            self.exampleView = nil
            self.exampleButton = nil
        }
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
    
    //  Animate the panning view and pass the frame to the masking button.
    //
    //
    @IBAction func sliderValueChanged(sender: UISlider) {
        let value = CGFloat(sender.value)
        
        switch (self.exampleButton.direction!) {
            
        case .LeftToRight:
            self.exampleView.frame.size.width = UIScreen.mainScreen().bounds.width * value
            
        case .RightToLeft:
            self.exampleView.frame.origin.x = UIScreen.mainScreen().bounds.width * value
            
        case .TopToBottom:
            self.exampleView.frame.size.height = UIScreen.mainScreen().bounds.height * 0.5 * value
            
        case .BottomToTop:
            self.exampleView.frame.origin.y = UIScreen.mainScreen().bounds.height * (0.5 * value + 0.25)
            self.exampleView.frame.size.height = UIScreen.mainScreen().bounds.height / 2.0 * (1.0 - value)
            
            print(self.exampleView.frame.origin.y, self.exampleView.frame.size.height)
        }
        
         self.exampleButton.updateColorOffset(self.exampleView.frame)
        
    }
}

