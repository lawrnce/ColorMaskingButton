//
//  ViewController.swift
//  ColorMaskingButton
//
//  Created by Lawrence Tran on 04/01/2016.
//  Copyright (c) 2016 Lawrence Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//         let path = PocketSVG.pathFromSVGFileNamed(SVGname).takeUnretainedValue()
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
        self.label.text = "Left to Right"
        self.slider.setValue(0.0, animated: false)
    }
    
    private func setupRightToLeft() {
        self.label.text = "Right to Left"
        self.slider.setValue(0.0, animated: false)
    }
    
    private func setupTopToBottom() {
        self.label.text = "Top to Bottom"
        self.slider.setValue(0.0, animated: false)
    }
    
    private func setupBottomToTop() {
        self.label.text = "Bottom to Top"
        self.slider.setValue(0.0, animated: false)
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
}

