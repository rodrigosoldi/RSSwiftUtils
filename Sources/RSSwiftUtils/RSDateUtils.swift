//
//  RSDateUtils.swift
//
//
//  Created by Rodrigo Soldi on 19/06/24.
//

import Foundation

public struct RSDateUtils {
    
    public static func get(_ components: Calendar.Component..., from date: Date = Date(), calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: date)
    }

    public static func get(_ component: Calendar.Component, from date: Date = Date(), calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: date)
    }
    
	public static func incDay(_ date: Date = Date(), value: Int = 1) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: date)
    }
    
	public static func incWeek(_ date: Date = Date(), value: Int = 7) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: date)
    }
    
	public static func incHour(_ date: Date = Date(), value: Int = 1) -> Date? {
        return Calendar.current.date(byAdding: .hour, value: value, to: date)
    }
    
	public static func incMinute(_ date: Date = Date(), value: Int = 1) -> Date? {
        return Calendar.current.date(byAdding: .minute, value: value, to: date)
    }
    
	public static func previousWeek(_ date: Date = Date(), value: Int = -7) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: date)
    }
    
	public static func previousDay(_ date: Date = Date(), value: Int = -1) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: date)
    }
    
    public static func extractDateWithoutTime(date: Date?) -> Date? {
        guard let date else { return  nil }
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let dateComponents: DateComponents = calendar.dateComponents([.day, .month, .year], from: date)
        return calendar.date(from: dateComponents)
    }

    public static func extractTimeWithoutDate(date: Date?) -> Date? {
        guard let date else { return  nil }
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let dateComponents: DateComponents = calendar.dateComponents([.hour, .minute], from: date)
        return calendar.date(from: dateComponents)
    }
    
    public static func getDaysIn(month: Int, year: Int) -> Range<Int> {
        let calendar = Calendar.current

        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!

        return calendar.range(of: .day, in: .month, for: date)!        
    }
    
    public static func makeDate(day: Int, month: Int, year: Int) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: "\(day)/\(month)/\(year)")
    }
    
    public static func makeDates(for days: Range<Int>? = nil, month: Int, year: Int) -> [Date] {
        var _days = getDaysIn(month: month, year: year)
        if let days {
            _days = days
        }
        
        return _days.compactMap({ Self.makeDate(day: $0, month: month, year: year) })
    }
    
    public static func getDatesForCurrentWeek(firstWeekday: Int = 1) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = firstWeekday // Define first day of week as sunday

        let today = Date()
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        let startOfWeek = calendar.date(from: components)!

        var dates = [Date]()
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: i, to: startOfWeek) {
                dates.append(date)
            }
        }
        return dates
    }
    
}
