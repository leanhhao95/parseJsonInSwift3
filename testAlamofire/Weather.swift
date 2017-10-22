//
//  Weather.swift
//  ParseJSON2
//
//  Created by Cuu Long Hoang on 7/30/16.
//  Copyright © 2016 Long Hoang. All rights reserved.
//

import Foundation

struct Weather {
    var summary:String
    var temperature:Double
    var icon:String = "clear"
    var windSpeed:Double
    var precipType:String
    
    init?(jsonData: [String : AnyObject]) {
        guard let summary = jsonData["summary"] as? String else { return nil }
        guard let temperature = jsonData["temperature"] as? Double else { return nil }
        guard let windSpeed = jsonData["windSpeed"] as? Double else { return nil }
        guard let precipType = jsonData["precipType"] as? String else { return nil }
        
        self.summary = summary
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.precipType = precipType
        
        
        guard let icon = jsonData["icon"] as? String else {return}
        if icon != "" {
            self.icon = icon
        }
    }
}
