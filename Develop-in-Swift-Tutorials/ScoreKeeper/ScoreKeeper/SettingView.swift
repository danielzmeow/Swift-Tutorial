//
//  SettingView.swift
//  ScoreKeeper
//
//  Created by Daniel Zhang on 15/4/25.
//

import SwiftUI

struct SettingView: View {
    @Binding var startingPoint: Int
    @Binding var doesHighestScoreWin: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            
            Divider()
            
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            
            Picker("Pick Starting Points", selection: $startingPoint) {
                Text("0 Starting Point")
                    .tag(0)
                Text("10 Starting Points")
                    .tag(10)
                Text("20 Starting Points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var startingPoints = 10
    @Previewable @State var doesHighestScoreWin = true
    SettingView(startingPoint: $startingPoints, doesHighestScoreWin: $doesHighestScoreWin)
}
