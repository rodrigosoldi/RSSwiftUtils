//
//  RSDateUtils.swift
//
//
//  Created by Rodrigo Soldi on 19/06/24.
//

import Foundation

public struct RSDateUtils {
    
    static func get(_ components: Calendar.Component..., from date: Date = Date(), calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: date)
    }

    static func get(_ component: Calendar.Component, from date: Date = Date(), calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: date)
    }
    
    static func incDay(_ date: Date = Date()) -> Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: date)
    }
    
    static func incWeek(_ date: Date = Date()) -> Date? {
        return Calendar.current.date(byAdding: .day, value: 7, to: date)
    }
    
    static func incHour(_ date: Date = Date()) -> Date? {
        return Calendar.current.date(byAdding: .hour, value: 1, to: date)
    }
    
    static func incMinute(_ date: Date = Date()) -> Date? {
        return Calendar.current.date(byAdding: .minute, value: 1, to: date)
    }
    
    static func previousWeek(_ date: Date = Date()) -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: date)
    }
    
    static func previousDay(_ date: Date = Date()) -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: date)
    }
    
    static func extractDateWithoutTime(date: Date?) -> Date? {
        guard let date else { return  nil }
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let dateComponents: DateComponents = calendar.dateComponents([.day, .month, .year], from: date)
        return calendar.date(from: dateComponents)
    }

    static func extractTimeWithoutDate(date: Date?) -> Date? {
        guard let date else { return  nil }
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let dateComponents: DateComponents = calendar.dateComponents([.hour, .minute], from: date)
        return calendar.date(from: dateComponents)
    }
    
}
