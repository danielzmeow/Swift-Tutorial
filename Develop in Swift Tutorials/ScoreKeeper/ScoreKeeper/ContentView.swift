//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Daniel Zhang on 14/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreBoard = Scoreboard()
    @State private var startingPoints: Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Score Keeper")
                .bold()
                .font(.title)
            
            SettingView(startingPoint: $startingPoints, doesHighestScoreWin: $scoreBoard.doesHighestScoreWin)
                .disabled(scoreBoard.state != .setup)

                // $players: bind the array list. $player: each player in players (list)
            List {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Score")
                }
                .bold()
                    
                ForEach($scoreBoard.players) { $player in
                    HStack {
                        HStack {
                            if scoreBoard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
                        Text("\(player.score)")
                            .padding(.trailing)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
                .onDelete{ scoreBoard.players.remove(atOffsets: $0) }
                .onMove{ scoreBoard.players.move(fromOffsets: $0, toOffset: $1) }
                
                Button("Add Player", systemImage: "plus") {
                    scoreBoard.players.append(Player(name: "", score: startingPoints))
                }
                .labelStyle(.titleOnly)
                .foregroundStyle(Color.accentColor)
                
                EditButton()
                    .foregroundStyle(Color.accentColor)
            }
            .listStyle(.plain)
            
            switch scoreBoard.state {
            case .setup:
                Button("Play Game", systemImage: "play.fill") {
                    scoreBoard.state = .playing
                    scoreBoard.resetScores(to: startingPoints)
                }
                .padding(.leading)
                
            case .playing:
                Button("End Game", systemImage: "stop.fill") {
                    scoreBoard.state = .gameOver
                }
                .padding(.leading)
                
            case .gameOver:
                Button("Reset Game", systemImage: "arrow.counterclockwise") {
                    scoreBoard.state = .setup
                }
                .padding(.leading)
            }

        }
        .padding()
    }
}


#Preview {
    ContentView()
}
