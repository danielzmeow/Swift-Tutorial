//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Daniel Zhang on 10/4/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 35)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "list.bullet.rectangle")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 70))
            }
            
            Text("Welcome to My App")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("This a subscritption app")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}
