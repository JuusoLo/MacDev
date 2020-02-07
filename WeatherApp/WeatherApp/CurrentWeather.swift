//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Juuso on 31.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View  {
    var weather: Weather?

    var height: CGFloat = 0

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today in \(weather?.name ?? "Unkown")")
            .font(.title)
            .foregroundColor(.white)
            .bold()
            HStack{
                Text("\(weather?.main.temp.round ?? 0)")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(.system(size: 65))
                Image(weather?.weather.last?.icon ?? "01d")
                .resizable()
                    .frame(width: 130, height: 130)
                    .aspectRatio(contentMode: .fit)
            }
            Text("\(weather?.weather.last?.description ?? "Unkown")")
                .foregroundColor(.white)
                .font(.body)
            Text("\(weather?.main.tempMax.round ?? 0)")
                .foregroundColor(.white)
                .font(.body)
        }.frame(width: height, height: height)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
