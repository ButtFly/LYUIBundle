//
//  L.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/14.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit


/// 布局的归一化
public enum L {
    
    public static let screenWidth = UIScreen.main.bounds.width
    public static let screenHeight = UIScreen.main.bounds.height
    public static let screenScale = UIScreen.main.scale
    
    
    static func x(_ x: CGFloat, standardWidth: CGFloat = 375) -> CGFloat {
        var v = (screenWidth / standardWidth * x) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    
    static func x(_ x: Int, standardWidth: CGFloat = 375) -> CGFloat {
        var v = (screenWidth / standardWidth * CGFloat(x)) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    static func y(_ y: CGFloat, standardHeight: CGFloat = 667) -> CGFloat {
        var v = (screenHeight / standardHeight * y) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    static func y(_ y: Int, standardHeight: CGFloat = 667) -> CGFloat {
        var v = (screenHeight / standardHeight * CGFloat(y)) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    static func solid(_ x: CGFloat) -> CGFloat {
        ceil(x * screenScale) / screenScale
    }
    
}


public extension L {
    
    static var minLine: CGFloat {
        get {
            return (screenScale == 3) ? (2 / screenScale) : (1 / screenScale)
        }
    }
    
}
