//
//  API.swift
//  WeatherProject
//
//  Created by macbookbro on 18.06.2024.
//

import Foundation

final class APiManager {
    private let apiKey = "a3df1c3e31c4f316c73db6ad22dd8234"
    func load(completion: @escaping (Weather?) -> Void) {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=\(apiKey)") else {return}
        
        let session = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {return}
            
            let weather = try? JSONDecoder().decode(Weather.self, from: data)
            
            completion(weather)
            
        }
        
        session.resume()
    }
}
