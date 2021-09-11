//
//  String+Extensions.swift
//  String+Extensions
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
