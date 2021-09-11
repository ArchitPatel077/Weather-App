//
//  Constants.swift
//  Constants
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=0466f7cc4f43dae0a50b81979402eaa9&units=imperial")!
        }
    }
}
