//
//  ViewController.swift
//  Client Family Test
//
//  Created by Zachary Duncan on 7/11/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stack: UIStackView!
    var fakeData: [FakeData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fakeData = [
            FakeData(header: "Average Daily Steps", datum: 16532, unitType: "STEPS", date: Date()),
            FakeData(header: "Peak Heartrate", datum: 163, unitType: "BPM", date: Date()),
            FakeData(header: "Rate of Daily Meds Taken", datum: 100, unitType: "%", date: Date())
        ]
        
        guard let fakeData = fakeData else { return }
        for datum in fakeData {
            let dataCard = DataCard()
            
            dataCard.header = datum.header
            dataCard.datum = datum.datum
            dataCard.unitType = datum.unitType
            dataCard.date = datum.date
            
            stack.addArrangedSubview(dataCard)
        }
    }
}

class FakeData {
    var header: String
    var datum: NSNumber
    var unitType: String
    var date: Date
    
    init(header: String, datum: NSNumber, unitType: String, date: Date) {
        self.header = header
        self.datum = datum
        self.unitType = unitType
        self.date = date
    }
}


