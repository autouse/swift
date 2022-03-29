//
//  UIViewExtension.swift
//
//  Created by infinity on 13.12.2021.
//

import UIKit

extension UIView {
    
    func insert(in view: UIView) {
        autoresizingMask = []
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
    }
    
    func center(x: CGFloat? = nil, y: CGFloat? = nil, xRatio: CGFloat? = nil, yRatio: CGFloat? = nil) {
        guard let superview = superview else {
            return
        }
        guard !(
            (x != nil && xRatio != nil) || (y != nil && yRatio != nil)
        ) else {
            fatalError()
        }
        if let x = x {
            centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: x).isActive = true
        }
        if let y = y {
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: y).isActive = true
        }
        
        if let xRatio = xRatio {
            let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: xRatio * 2, constant: 0)
            superview.addConstraint(constraint)
        }
        if let yRatio = yRatio {
            let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: yRatio * 2, constant: 0)
            superview.addConstraint(constraint)
        }
        
    }
    
    func pin(left: CGFloat, right: CGFloat) {
        guard let superview = superview else {
            return
        }
        leftAnchor.constraint(equalTo: superview.leftAnchor, constant: left).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -right).isActive = true
    }
    
    func pin(top: CGFloat? = nil, topSafe: CGFloat? = nil, bottom: CGFloat? = nil, bottomSafe: CGFloat? = nil) {
        guard let superview = superview else {
            return
        }
        if let top = top {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom).isActive = true
        }
        if #available(iOS 11, *) {
            if let topSafe = topSafe {
                topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: topSafe).isActive = true
            }
            if let bottomSafe = bottomSafe {
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -bottomSafe).isActive = true
            }
        }
    }
    
}