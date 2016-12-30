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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeNavbarStartColorToBlue(_ sender: Any) {
        if let navbar = self.navigationController?.navigationBar as? GradientNavigationBar
        {
            navbar.startColor = UIColor.blue
        }
    }
    
    
    @IBAction func changeNavbarEndColorToRed(_ sender: Any) {
        if let navbar = self.navigationController?.navigationBar as? GradientNavigationBar
        {
            navbar.endColor = UIColor.red
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

