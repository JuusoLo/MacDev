//
//  WeeklyWeatherViewModel.swift
//  WeatherApp
//
//  Created by Juuso on 3.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var weather: WeeklyWeather?
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city: String = "London") {
        API.weeklyWeather(city) {
            self.weather = $0
        }
    }
}
