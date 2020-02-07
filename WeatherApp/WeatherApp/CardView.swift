//
//  CardView.swift
//  WeatherApp
//
//  Created by Juuso on 3.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var list: ListData

    var body: some View {
        VStack{
            Text(dayOfTheWeekFromTimestamp(list.dt.timestamp))
                .font(.title)
                .foregroundColor(.white)
            HStack{
                Text("\(list.temp.day.round)º")
                    .font(.title).bold()
                    .foregroundColor(.white)
                Image(list.weather.last?.icon ?? "01d")
                Text(list.temp.min.round.toString)
                        .font(.system(size: 26, weight: .thin))
                    .foregroundColor(.white)
            }
            Text(list.weather.last?.description ?? "Unkown")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier: ViewModifier {
    var timestamp: TimeInterval

    init(_ timestamp: TimeInterval) {
        self.timestamp = timestamp
    }

    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            
    }

    private var day: String {
        return dayOfTheWeekFromTimestamp(self.timestamp)
    }
}
