//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Juuso on 31.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//




import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject{
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(city: String = "Lappeenranta"){
        API.fetchCurrentWeather(by: city){
            self.current = $0
        }
    }
}
