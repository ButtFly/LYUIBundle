//
//  IBView.swift
//  LYUIBundle
//
//  Created by 阿卡丽 on 2020/1/6.
//

import UIKit

@IBDesignable open class IBView: UIView {
    
    public private(set) var contentView: UIView!
    
    public var contentViewIndex: Int {
        return 0
    }
    
    public var nibName: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView()
    }
    
    func initContentView() -> Void {
        if contentView == nil {
            let bundle = Bundle(for: type(of: self))
            let nibs = bundle.loadNibNamed(nibName, owner: self, options: nil) as! [UIView]
            contentView = nibs[contentViewIndex]
            addSubview(contentView)
        }
        contentView.frame = bounds
    }
    
}

