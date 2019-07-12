//
//  Card.swift
//  Client Family Test
//
//  Created by Zachary Duncan on 7/11/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import UIKit

@IBDesignable class Card: UIButton {
    /// Use this to place elements inside of the Card
    var view: UIView = UIView()
    
    /// Use this to set the background color of the Card.
    /// Gradient and shadow will be set automatically
    var color: UIColor = .blue {
        didSet {
            backgroundColor = color
            setGradient()
            
            if hasShadow {
                var shColor: UIColor

                switch colorScheme {
                case .lightToDark:
                    shColor = color - 0.3
                case .darkToLight:
                    shColor = color - 0.2
                case .complementaryNatural:
                    shColor = color.complementary() - 0.2
                case .complementaryLight:
                    shColor = color.complementary()
                case .complementaryDark:
                    shColor = color.complementary() - 0.4
                }

                addShadow(radius: 0, dY: 2.5, dX: 0, color: shColor)
            }
        }
    }
    
    func set(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    /// This is the background color's gradient. It will be set and used automatically
    private let gradientLayer = CAGradientLayer()
    var colorScheme: ColorScheme = .lightToDark
    var hasShadow: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    override func didMoveToSuperview() {
        setGradient()
        layoutIfNeeded()
        //Update Frames
        //updateConstraints()
    }
    
    private func sharedInit() {
        setTitle("", for: .normal)
        roundCorners(.card)
        color = #colorLiteral(red: 0, green: 0.6280093268, blue: 1, alpha: 1)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.roundCorners(.card)
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        layoutIfNeeded()
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchDragExit), for: .touchDragExit)
        addTarget(self, action: #selector(touchDragEnter), for: .touchDragEnter)
    }
    
    private func setGradient() {
        gradientLayer.frame = bounds
        
        switch colorScheme {
        case .lightToDark:
            gradientLayer.colors = lightToDark()
        case .darkToLight:
            gradientLayer.colors = darkToLight()
        case .complementaryNatural:
            gradientLayer.colors = complementaryNatural()
        case .complementaryLight:
            gradientLayer.colors = complementaryLight()
        case .complementaryDark:
            gradientLayer.colors = complementaryDark()
        }
        
        gradientLayer.borderColor = layer.borderColor
        gradientLayer.borderWidth = layer.borderWidth
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// The action should be provided by the implementer of the Card
    ///
    /// super.touchUpInside() should always be called when overriding
    @objc func touchUpInside() {
        color += 0.1
    }
    
    @objc private func touchDown() {
        color -= 0.1
    }
    
    @objc private func touchDragExit() {
        color += 0.1
    }
    
    @objc private func touchDragEnter() {
        color -= 0.1
    }
}

// Color gradients
extension Card {
    enum ColorScheme {
        case lightToDark
        case darkToLight
        case complementaryNatural
        case complementaryLight
        case complementaryDark
    }
    
    func lightToDark() -> [CGColor] {
        return [color.cgColor, (color - 0.01).cgColor, (color - 0.05).cgColor, (color - 0.1).cgColor]
    }
    
    func darkToLight() -> [CGColor] {
        return [(color - 0.1).cgColor, color.cgColor]
    }
    
    func complementaryNatural() -> [CGColor] {
        return [color.cgColor, color.complementary().cgColor]
    }
    
    func complementaryLight() -> [CGColor] {
        return [color.cgColor, (color.complementary() + 0.2).cgColor]
    }
    
    func complementaryDark() -> [CGColor] {
        return [color.cgColor, (color.complementary() - 0.2).cgColor]
    }
}
