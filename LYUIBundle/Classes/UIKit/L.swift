//
//  L.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/14.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit


/// 布局的归一化
class L: NSObject {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    static let screenScale = UIScreen.main.scale
    
    
    class func x(_ x: CGFloat, standardWidth: CGFloat = 375) -> CGFloat {
        var v = (screenWidth / standardWidth * x) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    
    class func x(_ x: Int, standardWidth: CGFloat = 375) -> CGFloat {
        var v = (screenWidth / standardWidth * CGFloat(x)) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    class func y(_ y: CGFloat, standardHeight: CGFloat = 667) -> CGFloat {
        var v = (screenHeight / standardHeight * y) * screenScale
        v = round(v)
        return v / screenScale
    }
    
    class func y(_ y: Int, standardHeight: CGFloat = 667) -> CGFloat {
        var v = (screenHeight / standardHeight * CGFloat(y)) * screenScale
        v = round(v)
        return v / screenScale
    }
    
}


extension L {
    
    static var minLine: CGFloat {
        get {
            return (screenScale == 3) ? (2 / screenScale) : (1 / screenScale)
        }
    }
    
}
