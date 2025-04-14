//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Daniel Zhang on 10/4/25.
//

import SwiftUI

let welcomeColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturePage()
        }
        .tabViewStyle(.page)
        .background(Gradient(colors: welcomeColors))
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
