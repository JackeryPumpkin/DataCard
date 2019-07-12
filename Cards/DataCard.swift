//
//  DataCard.swift
//  Client Family Test
//
//  Created by Zachary Duncan on 7/11/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import UIKit

class DataCard: Card {
    var header: String = "Data Header Label" { didSet { headerLabel.text = header } }
    var datum: NSNumber = 0 { didSet { datumLabel.text = "\(datum)" } }
    var unitType: String = "UNITS" { didSet { unitTypeLabel.text = unitType } }
    var date: Date = Date() { didSet { dateLabel.text = "\(date)" } }
    
    private let headerLabel = UILabel()
    private let datumLabel = UILabel()
    private let unitTypeLabel = UILabel()
    private let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        sharedInit()
    }
    
    private func sharedInit() {
        //color = #colorLiteral(red: 0, green: 0.8235294223, blue: 0.04214655889, alpha: 1)
        colorScheme = .lightToDark
        
        // Text
        headerLabel.text = header
        datumLabel.text = "\(datum)"
        unitTypeLabel.text = unitType
        dateLabel.text = "\(date)"
        
        // Format
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        headerLabel.textColor = .white
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        dateLabel.textColor = .white
        unitTypeLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        unitTypeLabel.textColor = .white
        datumLabel.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        datumLabel.textColor = .white
        
        // Layout
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        headerLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -15).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        unitTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unitTypeLabel)
        unitTypeLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10).isActive = true
        unitTypeLabel.rightAnchor.constraint(equalTo: dateLabel.rightAnchor, constant: 0).isActive = true
        
        datumLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datumLabel)
        datumLabel.firstBaselineAnchor.constraint(equalTo: unitTypeLabel.firstBaselineAnchor, constant: 0).isActive = true
        datumLabel.rightAnchor.constraint(equalTo: unitTypeLabel.leftAnchor, constant: -2).isActive = true
        datumLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0).isActive = true
        
        layoutIfNeeded()
    }
    
    override func touchUpInside() {
        super.touchUpInside()
    }
}
