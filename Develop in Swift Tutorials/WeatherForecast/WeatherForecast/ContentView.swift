//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Daniel Zhang on 8/4/25.
//

import SwiftUI

struct ContentView: View {
    let currentDate = Date()
    
    var body: some View {
        HStack {
            DayForecast(day: "Mon", high: 25, low: 15, isRainy: false)
            DayForecast(day:"Tue", high: 28, low: 20, isRainy: true)
        }
        .padding()
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
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
    }
}

#Preview {
    ContentView()
}
