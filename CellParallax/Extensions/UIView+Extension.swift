//
//  UIView+Extension.swift
//  CellParallax
//
//  Created by Don Pironet on 12/04/2017.
//  Copyright © 2017 True Natives. All rights reserved.
//

import UIKit

extension UIView {
    func findSuperViewWithClass<T>(superViewClass : T.Type) -> T? {
        
        var xsuperView: UIView! = self.superview!
        var foundSuperView: UIView!
        
        while (xsuperView != nil && foundSuperView == nil) {
            
            if xsuperView.self is T {
                foundSuperView = xsuperView
            } else {
                xsuperView = xsuperView.superview
            }
        }
        return foundSuperView as? T
    }
}
