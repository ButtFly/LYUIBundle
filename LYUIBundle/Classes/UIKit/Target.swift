//
//  Targart.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/21.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit

open class Target: NSObject {
    
    public weak var target: NSObject?
    public var selector: Selector
    public init(target: NSObject, selector: Selector) {
        self.target = target
        self.selector = selector
    }
    
    @discardableResult
    public func doPerform() -> Unmanaged<AnyObject>? {
        return target?.perform(selector)
    }
    
    @discardableResult
    public func doPerform(with object: Any) -> Unmanaged<AnyObject>? {
        return target?.perform(selector, with: object)
    }
    
    @discardableResult
    public func doPerform(with object1: Any, with object2: Any) -> Unmanaged<AnyObject>? {
        return target?.perform(selector, with: object1, with: object2)
    }

}

