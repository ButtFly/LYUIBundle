//
//  Targart.swift
//  AMapDemo
//
//  Created by ButtFly on 2019/10/21.
//  Copyright © 2019 ButtFly. All rights reserved.
//

import UIKit

open class LYTarget: NSObject {
    
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


 /**
 *  闭包的调用，U是这个动作约定返回到handle里面的back值。使用方式为，在需要约定回调返回的地方创建一个LYAction，
 *  需要回调的地方调用handle方法去实现回调，handle方法中的参数第一个值会原封不动的返回到handle的回调block中，只是这个
 *  值是weak的，可以放心使用，不需要担心引用循环。甚至可以直接将这个值写为self：
 *  class A: NSObject {

     let action = LYAction<A>()
     
     func userTouchBack() -> Void {
         action.doHandle(self)
     }
     
 *  }

 *  class B: NSObject {
 
     let a = A()
     override init() {
         a.action.handle(self) { (self, backA) in
             print(self.a)
         }
     }
 
 *  }
 */

open class LYAction<U> {
    
    fileprivate weak var target: AnyObject? = nil
    
    fileprivate var handleBlock: ((_ target: AnyObject, _ back: U?) -> Void)? = nil
    
    public init() {}
    
    public func handle<T: AnyObject>(_ target: T, _ handle: @escaping ((_ target: T, _ back: U?) -> Void)) {
        self.target = target
        self.handleBlock = { (t, p) in
            guard let t = t as? T else {
                return
            }
            handle(t, p)
        }
    }
    
    final public func doHandle(_ res: U? = nil) -> Void {
        guard let t = target else {
            return
        }
        self.handleBlock?(t, res)
    }
}

