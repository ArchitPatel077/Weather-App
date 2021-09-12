//
//  WeatherListViewModel.swift
//  WeatherListViewModel
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

//MARK: - WeahterListViewModel Class

class WeahterListViewModel {
    
    private var weatherViewModels =  [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section : Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index : Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
        weatherViewModels.map { vm in
            
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32 ) * 5/9
            return weatherModel
        }
    }
    
    func updateUnit(to unit : Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit
            toFahrenheit()
        }
    }
}

//MARK: - WeatherViewModel Class

class WeatherViewModel {
    
    let weather : WeatherResponse
    
    init(weather : WeatherResponse){
        self.weather = weather
    }
    
    var city : String {
        return weather.name
    }
    
    var temperature : Double {
        return weather.main.temp
    }
}
