//
//  UIColor-AMD.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/12.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit

extension UIColor {
    
    open class func colorWith(intValue: Int, alpha: CGFloat = 1) -> UIColor {
        var cValue = intValue
        let blue = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let green = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let red = CGFloat(cValue % 256) / CGFloat(255)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
