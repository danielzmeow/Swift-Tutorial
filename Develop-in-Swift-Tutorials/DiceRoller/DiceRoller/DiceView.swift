//
//  DiceView.swift
//  DiceView
//
//  Created by Daniel Zhang on 11/4/25.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth:100, maxHeight:100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(Color.black, Color.white)
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .font(.title3.bold())
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
