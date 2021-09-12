//
//  AddWeatherCityViewController.swift
//  AddWeatherCityViewController
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

//MARK: - AddWeatherDelegate Protocol

protocol AddWeatherDelegate {
    
    func addWeatherDidSave(vm: WeatherViewModel)
    
}

//MARK: - AddWeatherCityViewController

class AddWeatherCityViewController : UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate : AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField : UITextField!
    
    //MARK: - SAVE Button
    
    @IBAction func saveCityButtonPressed() {
         
        if let city = cityNameTextField.text {
            
            addWeatherVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil )
            }
        }
        
    }
    
    //MARK: - CLOSE Button
    
    @IBAction func close() {
     
        self.dismiss(animated: true, completion: nil )
    }
    
}
