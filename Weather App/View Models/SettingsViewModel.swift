//
//  SettingsViewModel.swift
//  SettingsViewModel
//
//  Created by Archit Patel on 2021-09-12.
//

import UIKit

enum Unit : String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName : String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

//MARK: - SettingsViewModel

class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit : Unit {
        
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
