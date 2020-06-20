//
//  DailyWeatherViewModel.swift
//  Weather
//
//  Created by Bobby Conti on 6/10/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import Foundation

struct DailyWeatherViewModel {
    var data: [Data]
    
    struct Data {
        var day: String
        var temperatureHigh: String
        var temperatureLow: String
        var icon: String
    }
    
    init() {
        self.data = [Data]()
    }
    
    init(model: DailyWeather) {
        self.init()
        
        if(model.data.count > 0) {
            for index in 1...5 {
                self.appendData(time: model.data[index].time, temperatureHigh: model.data[index].temperatureHigh, temperatureLow: model.data[index].temperatureLow, icon: model.data[index].icon)
            }
        } else {
             for _ in 1...5 {
                let time = Double(Date().timeIntervalSinceNow)
                self.appendData(time: time, temperatureHigh: 25, temperatureLow: 17, icon: "default")
            }
        }
    }
    
    mutating func appendData(time: Double, temperatureHigh: Double, temperatureLow: Double, icon: String) {
        
        let date = Date(timeIntervalSince1970: time)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let formattedDay = formatter.string(from: date)
        
        let roundedHighTemperature = Int(temperatureHigh)
        let formattedTemperatureHigh = "\(roundedHighTemperature)º"
        
        let roundedLowTemperature = Int(temperatureLow)
        let formattedTemperatureLow = "\(roundedLowTemperature)º"
        
        let formattedIcon = icon
        
        self.data.append(Data(day: formattedDay, temperatureHigh: formattedTemperatureHigh, temperatureLow: formattedTemperatureLow, icon: formattedIcon))
    }
}
