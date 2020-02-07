//
//  ContentView.swift
//  WeatherApp
//
//  Created by Juuso on 27.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()

    var body: some View {
        VStack {
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 0.50).animation(.easeInOut(duration: 0.5))
            }
            VStack{
                Picker("", selection: $selected){
                    Text("Today")
                        .tag(0)
                    Text("Week")
                        .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}


// this is an extension to make our Double as a whole nnumber without decimal value
//extension Double {
//    var round: Int {
//        return Int(self)
//    }
//}
