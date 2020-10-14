//
//  L.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/14.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit


/// 抽象归一化能力
public protocol LayoutNormalizationEnable {
    
    /// 标准的屏幕宽度
    static var standardWidth: CGFloat {get}
    
    /// 标准的屏幕高度
    static var standardHeight: CGFloat {get}
    
    /// 在当前设备中，最细的线条宽度
    static var minLine: CGFloat {get}
    
    /// 以设计图宽度为标准返回合适的值
    /// - Parameter x: <#x description#>
    static func x(_ x: CGFloat) -> CGFloat
    
    /// 以设计图高度为标准返回合适的值
    /// - Parameter y: <#y description#>
    static func y(_ y: CGFloat) -> CGFloat
    
    /// 返回适合当前屏幕布局的最合适的值
    /// - Parameter v: <#v description#>
    static func solid(_ v: CGFloat) -> CGFloat
    
    static func solidCeil(_ v: CGFloat) -> CGFloat
    
    static func solidFloor(_ v: CGFloat) -> CGFloat
}

public extension LayoutNormalizationEnable {
    private static var screenScale: CGFloat {
        UIScreen.main.scale
    }
    
    private static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    private static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static func x(_ x: CGFloat) -> CGFloat {
        return (screenWidth / standardWidth * x)
    }
    
    static func y(_ y: CGFloat) -> CGFloat {
        return (screenHeight / standardHeight * y)
    }
    
    static func solidCeil(_ v: CGFloat) -> CGFloat {
        ceil(v * screenScale) / screenScale
    }
    
    static func solid(_ v: CGFloat) -> CGFloat {
        round(v * screenScale) / screenScale
    }
    
    static func solidFloor(_ v: CGFloat) -> CGFloat {
        floor(v * screenScale) / screenScale
    }
    
    static var minLine: CGFloat {
        get {
            return (screenScale == 3) ? (2 / screenScale) : (1 / screenScale)
        }
    }
}
