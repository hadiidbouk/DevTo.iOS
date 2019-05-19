//
//  Date+Extensions.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

extension Date {
    
    func getDayIntervalTimeAgo() -> String? {
        
        let interval = Calendar.current.dateComponents([.hour, .minute, .second], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return nil
        } else if let month = interval.month, month > 0 {
            return nil
        } else if let day = interval.day, day > 0 {
            return nil
        } else if let hour = interval.hour, hour > 0 {
            if hour - 24 >= 0 {
                return nil
            }
            return hour == 1 ? "\(hour)" + " " + "hour ago" :
                "\(hour)" + " " + "hours ago"
        } else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute ago" :
                "\(minute)" + " " + "minutes ago"
        } else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "second ago" :
                "\(second)" + " " + "seconds ago"
        } else {
            return nil
        }
    }
}
