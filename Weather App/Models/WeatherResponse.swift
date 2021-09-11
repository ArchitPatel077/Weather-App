//
//  WeatherResponse.swift
//  WeatherResponse
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

struct WeatherResponse : Decodable {
    let name : String 
    let main : Weather
}

struct Weather : Decodable {
    let temp : Double
    let humidity : Double
}
