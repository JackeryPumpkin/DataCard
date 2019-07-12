//
//  UIColorExt.swift
//  Client Family Test
//
//  Created by Zachary Duncan on 7/11/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import UIKit

extension UIColor {
    ///Returns a lighter color
    static func +(color: UIColor, modification: Double) -> UIColor {
        let ciColor = CIColor(color: color)
        return UIColor(red: ciColor.red + CGFloat(modification),
                       green: ciColor.green + CGFloat(modification),
                       blue: ciColor.blue + CGFloat(modification),
                       alpha: ciColor.alpha)
    }
    
    ///Returns a darker color
    static func -(color: UIColor, modification: Double) -> UIColor {
        return color + -modification
    }
    
    ///The color on the left side of the equals sign will be made lighter
    static func +=(color: inout UIColor, modification: Double) {
        color = color + modification
    }
    
    ///The color on the left side of the equals sign will be made darker
    static func -=(color: inout UIColor, modification: Double) {
        color = color - modification
    }
    
    ///Returns true if the left side of the comparison is lighter
    static func >(left: UIColor, right: UIColor) -> Bool {
        guard let lComponents = left.cgColor.components else { return false }
        guard let rComponents = right.cgColor.components else { return false }
        
        var lTotal: CGFloat = 0
        var rTotal: CGFloat = 0
        
        for i in 0 ..< lComponents.count {
            if i != lComponents.count - 1 {
                lTotal += lComponents[i]
            }
        }
        
        for i in 0 ..< rComponents.count {
            if i != rComponents.count - 1 {
                rTotal += rComponents[i]
            }
        }
        
        return lTotal > rTotal
    }
    
    ///Returns true if the left side of the comparison is darker
    static func <(left: UIColor, right: UIColor) -> Bool {
        return !(left > right)
    }
    
    
    ///Returns true if the both sides of the comparison are the same color
    static func ==(left: UIColor, right: UIColor) -> Bool {
        guard let lComponents = left.cgColor.components else { return false }
        guard let rComponents = right.cgColor.components else { return false }
        
        var lTotal: CGFloat = 0
        var rTotal: CGFloat = 0
        
        for i in 0 ..< lComponents.count {
            if i != lComponents.count - 1 {
                lTotal += lComponents[i]
            }
        }
        
        for i in 0 ..< rComponents.count {
            if i != rComponents.count - 1 {
                rTotal += rComponents[i]
            }
        }
        
        return lTotal == rTotal
    }
    
    func image() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        self.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    func complementary() -> UIColor {
        let ciColor = CIColor(color: self)
        
        // get the current values and make the difference from white:
        let compRed: CGFloat = 1.0 - ciColor.red
        let compGreen: CGFloat = 1.0 - ciColor.green
        let compBlue: CGFloat = 1.0 - ciColor.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
    }
}
