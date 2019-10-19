//
//  Weight.swift
//  MyHealthApp
//
//  Created by Nikolai Vazquez on 10/19/19.
//  Copyright © 2019 Nikolai Vazquez. All rights reserved.
//

enum WeightUnit {
    case kg
    case lb
    
    var opposite: Self {
        switch self {
        case .kg:
            return .lb
        case .lb:
            return .kg
        }
    }
}

struct Weight {
    var value: Double
    var unit: WeightUnit
    
    var kgValue: Double {
        switch unit {
        case .kg:
            return value
        case .lb:
            return value / 2.2
        }
    }
    
    func converted(to newUnit: WeightUnit) -> Self {
        switch (self.unit, newUnit) {
        case (.kg, .lb):
            let newValue = value * 2.2
            return Weight(value: newValue, unit: newUnit)
            
        case (.lb, .kg):
            let newValue = value / 2.2
            return Weight(value: newValue, unit: newUnit)
            
        default:
            return self
        }
    }
    
    func flipped() -> Self {
        return converted(to: unit.opposite)
    }
}
