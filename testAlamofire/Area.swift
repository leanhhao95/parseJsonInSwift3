//
//  Area.swift
//  ParseJSON2
//
//  Created by Cuu Long Hoang on 7/30/16.
//  Copyright © 2016 Long Hoang. All rights reserved.
//

import Foundation

struct Area {
    var timeZone:String
    var currently:Weather
    var hourly:[Weather] = [Weather]()
    
    init?(jsonData: [String:AnyObject]) {
        guard let timeZone = jsonData["timezone"] as? String else {return nil}
        guard let currentlyData = jsonData["currently"] as? [String : AnyObject] else { return nil }
        
        guard let currently = Weather(jsonData: currentlyData) else { return nil }
        
        self.timeZone = timeZone
        self.currently = currently
        
        if let hourly = jsonData["hourly"] as? [String:AnyObject] {
            if let hourlyData = hourly["data"] as? [[String:AnyObject]] {
                for weatherData in hourlyData {
                    if let weather = Weather(jsonData: weatherData) {
                        self.hourly.append(weather)
                    }
                }
            }
            
        }
    }
}
