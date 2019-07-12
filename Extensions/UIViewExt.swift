//
//  UIViewExt.swift
//  Care
//
//  Created by Zachary Duncan on 6/28/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import UIKit

extension UIView {
    /// This will round the corners of your UIView or any subclass of UIView
    ///
    /// - Parameter radius: This will round the corners to their fullest if given nil
    @objc func roundCorners(radius: NSNumber?) {
        if self is UIImageView {
            clipsToBounds = true
        }
        
        if let radius = radius as? CGFloat {
            layer.cornerRadius = radius
        } else {
            layer.cornerRadius = frame.width > frame.height ? frame.height / 2 : frame.width / 2
        }
    }
    
    func roundCorners(_ level: Roundness) {
        if self is UIImageView {
            self.clipsToBounds = true
        }
        
        switch level {
        case .slight:
            layer.cornerRadius = 5.0
        case .card:
            layer.cornerRadius = 10.0
        case .oval:
            layer.cornerRadius = frame.width > frame.height ? frame.height / 2 : frame.width / 2
        }
    }
    enum Roundness {
        case slight
        case card
        case oval
    }
    
    /// Does all the work of creating the shadow and grooming the UIView for being able to support shadows.
    ///
    /// - Parameters:
    ///   - radius: Larger numbers yield fuzzier edges
    ///   - dY: How far below the view the shadow is offset
    ///   - dX: How far to the right the view the shadow is offset
    ///   - color: UIColor of the shadow
    func addShadow(radius: CGFloat, dY: CGFloat, dX: CGFloat, color: UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)) {
        layer.shadowOpacity = 1
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: dX, height: dY)
        layer.shadowColor = color.cgColor
    }
    
    func addBorders(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    func animateShow() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1
        })
    }
    
    func animateHide() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        })
    }
    
    func pulseBackground() {
        backgroundColor! -= 0.1
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut, .repeat, .allowUserInteraction], animations: {
            self.backgroundColor! += 0.1
        }, completion: nil)
    }
}
