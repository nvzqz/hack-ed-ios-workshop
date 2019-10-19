//
//  CalculatorViewController.swift
//  MyHealthApp
//
//  Created by Nikolai Vazquez on 10/19/19.
//  Copyright © 2019 Nikolai Vazquez. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var weight: Weight = Weight(value: 250, unit: .lb) {
        didSet {
            print(weight)
            let value = Int(exactly: weight.value.rounded()) ?? .max
            weightField.text = String(value)
            updateWaterLabel()
        }
    }
    
    var temperature: Temperature = Temperature(value: 80, unit: .fahrenheit) {
        didSet {
            print(temperature)
            let value = Int(exactly: temperature.value.rounded()) ?? .max
            temperatureField.text = String(value)
            updateWaterLabel()
        }
   }
    
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var temperatureField: UITextField!
    
    private func updateWaterLabel() {
        let waterValue = (weight.kgValue * 0.1)
            + (temperature.celsiusValue * 0.3)
        
        if waterValue < 0 {
            waterLabel.text = "n/a"
        } else if let waterValue = Int(exactly: waterValue.rounded()) {
            waterLabel.text = String(waterValue)
        } else {
            waterLabel.text = "n/a"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWaterLabel()
    }
    
    @IBAction func weightValueDidChange(_ sender: UITextField) {
        print(sender)
        if let newValue = sender.text.flatMap({ Double($0) }) {
            weight.value = newValue
        } else {
            weight.value = 0
        }
    }
    
    @IBAction func weightUnitDidChange(_ sender: UISegmentedControl) {
        print(sender)
        let unit: WeightUnit
        if sender.selectedSegmentIndex == 0 {
            unit = .lb
        } else {
            unit = .kg
        }
        weight = weight.converted(to: unit)
    }
    
    @IBAction func temperatureValueDidChange(_ sender: UITextField) {
        print(sender)
        if let newValue = sender.text.flatMap({ Double($0) }) {
            temperature.value = newValue
        } else {
            temperature.value = 0
        }
    }
    
    @IBAction func temperatureUnitDidChange(_ sender: UISegmentedControl) {
        print(sender)
        let unit: TemperatureUnit
        if sender.selectedSegmentIndex == 0 {
            unit = .fahrenheit
        } else {
            unit = .celsius
        }
        temperature = temperature.converted(to: unit)
    }

}
