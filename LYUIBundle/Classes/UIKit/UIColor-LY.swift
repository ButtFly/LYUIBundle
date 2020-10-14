//
//  UIColor-AMD.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/12.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// <#Description#>
    /// - Parameters:
    ///   - intValue: 色值表示，便捷为“0xaaaaaa”
    ///   - alpha: 透明度[0, 1]，默认为1
    convenience init(_ intValue: Int, alpha: CGFloat = 1) {
        var cValue = intValue
        let blue = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let green = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let red = CGFloat(cValue % 256) / CGFloat(255)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - string: 色值的表示，支持“#aaaaaa”
    ///   - alpha: 透明度[0, 1]，默认为1
    convenience init(_ string: String?, alpha: CGFloat = 1) {
        guard let str = string, let value = Double.init(str.replacingOccurrences(of: "#", with: "0x")) else {
            self.init(red: 1, green: 1, blue: 1, alpha: 0)
            return
        }
        var cValue = Int(value)
        let blue = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let green = CGFloat(cValue % 256) / CGFloat(255)
        cValue >>= 8
        let red = CGFloat(cValue % 256) / CGFloat(255)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

