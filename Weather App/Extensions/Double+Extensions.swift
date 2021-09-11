//
//  Double+Extensions.swift
//  Double+Extensions
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

extension Double {
    
    func formatAsDegree() -> String {
        return String(format : "%.0f°", self)
    }
}
