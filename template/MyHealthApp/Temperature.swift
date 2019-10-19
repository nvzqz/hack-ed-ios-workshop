//
//  Temperature.swift
//  MyHealthApp
//
//  Created by Nikolai Vazquez on 10/18/19.
//  Copyright © 2019 Nikolai Vazquez. All rights reserved.
//

enum TemperatureUnit {
    case celsius
    case fahrenheit
    
    var opposite: Self {
        switch self {
        case .celsius:
            return .fahrenheit
        case .fahrenheit:
            return .celsius
        }
    }
}

struct Temperature {
    var value: Double
    var unit: TemperatureUnit
    
    var celsiusValue: Double {
        switch unit {
        case .celsius:
            return value
        case .fahrenheit:
            return (value - 32) * 5 / 9
        }
    }
    
    func converted(to newUnit: TemperatureUnit) -> Self {
        switch (self.unit, newUnit) {
        case (.celsius, .fahrenheit):
            let newValue = (value * 9 / 5) + 32
            return Temperature(value: newValue, unit: newUnit)
            
        case (.fahrenheit, .celsius):
            let newValue = (value - 32) * 5 / 9
            return Temperature(value: newValue, unit: newUnit)
            
        default:
            return self
        }
    }
    
    func flipped() -> Self {
        return converted(to: unit.opposite)
    }
}
