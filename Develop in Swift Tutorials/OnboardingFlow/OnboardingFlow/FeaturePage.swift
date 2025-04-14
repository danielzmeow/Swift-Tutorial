//
//  FeaturePage.swift
//  OnboardingFlow
//
//  Created by Daniel Zhang on 10/4/25.
//

import SwiftUI

struct FeaturePage: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left.")
            
            FeatureCard(iconName: "keyboard", description: "A shorter test")
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    FeaturePage()
        .background(Gradient(colors: welcomeColors))
        .foregroundStyle(.white)
}
