//
//  Api.swift
//  WeatherApp
//
//  Created by Juuso on 27.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

private let baseUrlForCurrentWeather = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Lappeenranta")!
private let appid = "3c5129dea0ad9c8551bdca9e1e89db6b"
private let baseUrlForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

import SwiftUI

class API {
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void ){
        let query = ["q": "\(city)", "appid": appid, "units": "metric"]

        guard let url = baseUrlForCurrentWeather.withQueries(query) else {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
    
    class func weeklyWeather(_ city: String, onSuccess: @escaping (WeeklyWeather) -> Void) {
        let query = ["q": "\(city)", "appid": appid, "units": "metric", "cnt": "5"]
        guard baseUrlForWeeklyWeather.withQueries(query) != nil else { fatalError("Invalid URL for weekly weather")}
        guard let url = baseUrlForWeeklyWeather.withQueries(query) else { fatalError() }

        URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }

            do {
                let weather = try decoder.decode(WeeklyWeather.self, from:data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}
