//
//  WeatherJSON.swift
//  WeatherProject
//
//  Created by macbookbro on 18.06.2024.
//

import Foundation

struct Weather: Codable {
    let main: Main
    
}

struct Main: Codable {
    let temp: Double
}
