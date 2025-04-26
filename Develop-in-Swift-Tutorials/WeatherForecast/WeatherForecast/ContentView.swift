//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Daniel Zhang on 8/4/25.
//

import SwiftUI
import Foundation

var totalDays: Int = 0

struct ContentView: View {
    let currentDate = Date()
    
    var body: some View {
        VStack {
            WeekForecast(totalDays: 7)
            ScrollView(.horizontal) {
                HStack {
                    DayForecast(day: "Mon", high: 25, low: 15, isRainy: false)
                    DayForecast(day:"Tue", high: 28, low: 20, isRainy: true)
                    DayForecast(day: "Wed", high: 26, low: 18, isRainy: true)
                    DayForecast(day: "Thu", high: 24, low: 16, isRainy: false)
                    DayForecast(day: "Fri", high: 29, low: 21, isRainy: false)
                    DayForecast(day: "Sat", high: 27, low: 19, isRainy: true)
                    DayForecast(day: "Sun", high: 30, low: 22, isRainy: false)
                }
                .padding()
            }
        }
    }
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let isRainy: Bool
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var highTemColor: Color {
        if high >= 28 {
            return Color.red
        } else {
            return Color.primary
        }
    }
        
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.title2.bold())
                .font(Font.largeTitle)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .imageScale(.large)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
                .foregroundStyle(highTemColor)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let totalDays: Int
    
    var body: some View {
        VStack {
            Image(systemName: "cloud")
                .font(Font.largeTitle)
                .imageScale(.large)
            Text("\(totalDays) Days")
                .font(Font.title2.bold())
            HStack {
                Image(systemName: "thermometer")
                Text("Avg high 27")
                Text("&")
                Text("Avg Low 13")
            }
            .padding(.top, 5)
            
            HStack {
                Text("4 Sunny Days")
                Text("&")
                Text("3 Rainy Days")
            }
            .padding(.top, 5)
        }
    }
}

#Preview {
    ContentView()
}
