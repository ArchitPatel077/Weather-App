//
//  WeatherCell.swift
//  WeatherCell
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

class WeatherCell : UITableViewCell {
    
    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var tempratureLabel : UILabel!
    
    func configure(_ vm : WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.tempratureLabel.text = "\(vm.temperature.formatAsDegree())"
    }
    
}
