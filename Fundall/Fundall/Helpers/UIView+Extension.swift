//
//  UIView+Extension.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    public var identifier: String {
        return String(describing: self)
    }
}
