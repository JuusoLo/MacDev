//
//  Extension.swift
//  WeatherApp
//
//  Created by Juuso on 3.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

extension Double {
    var round: Int {
        return Int(self)
    }
}

extension Int {
    var timestamp: TimeInterval {
        return TimeInterval(self)
    }
    
    var toString: String {
        return String(self)
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            fatalError()
        }
        component.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value)}
        return component.url
    }
}

extension DateFormatter {
    convenience init(dateFormat: String){
        self.init()
        self.dateFormat = dateFormat
    }
}

extension Date {
    static func dateFromUnixTimestamp(_ timestamp: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: timestamp)
    }

    var day: String {
        let dateFormatter = DateFormatter(dateFormat: "EEEE")
        return dateFormatter.string(from: self)
    }
}

func dayOfTheWeekFromTimestamp(_ timestamp: TimeInterval) -> String {
    let date = Date.dateFromUnixTimestamp(timestamp)
    return date.day
}

extension Color{
    init(hex: String){
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = (rgbValue & 0xff)
        self.init(red: Double(r) / 0xff, green: Double(g) /  0xff, blue: Double(b) / 0xff)
    }
    static var monday: [Color] {
        return[Color.init(hex: "232526"),Color.init(hex:"414354")]
    }
    static var tuesday: [Color] {
    return[Color.init(hex: "FF512F"),Color.init(hex:"F09819")]
}
   static var wednesday: [Color] {
    return[Color.init(hex: "870000"),Color.init(hex:"190A05")]
}
   static var thursday: [Color] {
    return[Color.init(hex: "7F00FF"),Color.init(hex:"E100FF")]
}
static var friday: [Color] {
    return[Color.init(hex: "AA076B"),Color.init(hex:"61045F")]
}
static var saturday: [Color] {
    return[Color.init(hex: "e53935"),Color.init(hex:"e35d5b")]
}
static var sunday: [Color] {
    return[Color.init(hex: "2193b0"),Color.init(hex:"6dd5ed")]
}
}
func gradientColorOfTheDay( day: String) -> [Color]{
    switch day {
    case "Monday":
        return Color.monday
    case "Tuesday":
          return Color.tuesday
    case "Wednesday":
          return Color.wednesday
    case "Thursday":
          return Color.thursday
    case "Friday":
          return Color.friday
    case "Saturday":
          return Color.saturday
    case "Sunday":
          return Color.sunday
    default:
        return Color.monday
        }
    
}

