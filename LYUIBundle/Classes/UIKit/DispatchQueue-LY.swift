//
//  DispatchQueue-AMD.swift
//  WH5Run
//
//  Created by 阿卡丽 on 2019/11/11.
//

import UIKit

extension DispatchQueue {
    
    open func asyncInMain(_ block: @escaping (() -> Void)) -> Void {
        if Thread.current == Thread.main {
            block()
        } else {
            DispatchQueue.main.async {
                block()
            }
        }
    }
    
    open func syncInMain(_ block: @escaping (() -> Void)) -> Void {
        if Thread.current == Thread.main {
            block()
        } else {
            DispatchQueue.main.sync {
                block()
            }
        }
    }
    
}
