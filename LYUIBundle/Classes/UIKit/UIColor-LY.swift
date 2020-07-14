//
//  UIColor-AMD.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/12.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit

extension UIColor {
    
    @available(*, deprecated, message: "方法废弃，推荐使用colorWith(,alpha:)")
    open class func colorWith(intValue: Int, alpha: CGFloat = 1) -> UIColor {
        var cValue = intValue
        let blue = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let green = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let red = CGFloat(cValue % 256) / CGFloat(255)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    open class func colorWith(_ intValue: Int, alpha: CGFloat = 1) -> UIColor {
        var cValue = intValue
        let blue = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let green = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let red = CGFloat(cValue % 256) / CGFloat(255)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - string: 色值，支持的格式 “#B81B1B”
    ///   - alpha: <#alpha description#>
    /// - Returns: 如果不能解析字符串，返回透明色
    open class func colorWith(_ string: String?, alpha: CGFloat = 1) -> UIColor {
        guard let str = string, let value = Double.init(str.replacingOccurrences(of: "#", with: "0x")) else {
            return UIColor.clear
        }
        var cValue = Int(value)
        let blue = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let green = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let red = CGFloat(cValue % 256) / CGFloat(255)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

