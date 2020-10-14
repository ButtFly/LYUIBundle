//
//  ViewController.swift
//  LYUIBundle
//
//  Created by ButtFly on 01/02/2020.
//  Copyright (c) 2020 ButtFly. All rights reserved.
//

import UIKit
import LYUIBundle

enum L: LayoutNormalizationEnable {
    static var standardWidth: CGFloat = 375
    static var standardHeight: CGFloat = 667
}

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.red
        view.addSubview(line1)
        line1.frame = CGRect(x: 0, y: 100, width: 300, height: 0.8)
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.red
        view.addSubview(line2)
        line2.frame = CGRect(x: 0, y: 200, width: 300, height: 1.2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

