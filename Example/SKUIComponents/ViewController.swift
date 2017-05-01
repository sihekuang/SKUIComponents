//
//  ViewController.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 12/04/2016.
//  Copyright (c) 2016 Daniel Lee. All rights reserved.
//

import UIKit
import SKUIComponents

class ViewController: UIViewController {

    @IBOutlet weak var gradientProgressButton: SKGradientProgressButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gradientProgressButton.beginRotaionAnimation(isClockwise: true, periodInSec: 1)
    }
    
    @IBAction func changeNavbarStartColorToBlue(_ sender: Any) {
        if let navbar = self.navigationController?.navigationBar as? SKGradientNavigationBar
        {
            navbar.startColor = UIColor.blue
        }
    }
    
    
    @IBAction func changeNavbarEndColorToRed(_ sender: Any) {
        if let navbar = self.navigationController?.navigationBar as? SKGradientNavigationBar
        {
            navbar.endColor = UIColor.red
        }
    }
    
    @IBAction func gradientButtonTapped(_ sender: Any) {
        if !gradientProgressButton.isAnimating{
            gradientProgressButton.beginRotaionAnimation(isClockwise: true, periodInSec: 0.5)
        }else{
            gradientProgressButton.stopRotationAnimation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

