//
//  UIFont-AMD.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/14.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit

//MARK: - 设计常使用的字体
extension UIFont {
    
    public class func pingFangSC(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func pingFangSCLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func pingFangSCMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func pingFangSCSemibold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func dinCondensed(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "DINCondensed-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func helveticaNeueCondensedBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-CondensedBold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}

