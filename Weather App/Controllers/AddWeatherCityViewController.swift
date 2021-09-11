//
//  AddWeatherCityViewController.swift
//  AddWeatherCityViewController
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

protocol AddWeatherDelegate {
    
    func addWeatherDidSave(vm: WeatherViewModel)
    
}

class AddWeatherCityViewController : UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate : AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField : UITextField!
    
    
    @IBAction func saveCityButtonPressed() {
         
        if let city = cityNameTextField.text {
            
            addWeatherVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil )
            }
        }
        
    }
    
    @IBAction func close() {
     
        self.dismiss(animated: true, completion: nil )
    }
    
}
