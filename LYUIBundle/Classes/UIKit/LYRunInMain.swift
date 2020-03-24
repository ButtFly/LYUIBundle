//
//  DispatchQueue-AMD.swift
//  WH5Run
//
//  Created by 阿卡丽 on 2019/11/11.
//

import UIKit

public enum LYRunInMain {
    
    public static func async(_ block: @escaping (() -> Void)) -> Void {
        if Thread.current == Thread.main {
            block()
        } else {
            DispatchQueue.main.async {
                block()
            }
        }
    }
    
    public static func sync(_ block: @escaping (() -> Void)) -> Void {
        if Thread.current == Thread.main {
            block()
        } else {
            DispatchQueue.main.sync {
                block()
            }
        }
    }
    
}
