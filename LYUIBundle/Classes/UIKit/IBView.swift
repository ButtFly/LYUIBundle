//
//  IBView.swift
//  LYUIBundle
//
//  Created by 阿卡丽 on 2020/1/6.
//

import UIKit

@IBDesignable open class IBView: UIView {
    
    public private(set) var contentView: UIView!
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if contentView == nil {
            let bundle = Bundle(for: type(of: self))
            contentView = (bundle.loadNibNamed(NSStringFromClass(type(of: self)).components(separatedBy: ".").last!, owner: self, options: nil)!.first! as! UIView)
            addSubview(contentView)
        }
        contentView.frame = bounds
    }
    
}
