//
//  ContentView.swift
//  DiceRoller
//
//  Created by Daniel Zhang on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps().bold())
                .foregroundStyle(Color.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.self ) { _ in
                    DiceView()
                }
            }
            .padding()
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
            }
            .labelStyle(.iconOnly)
            .font(.title)
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .tint(Color.white)
    }
}

#Preview {
    ContentView()
}
