//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Daniel Zhang on 14/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Tom", score: 2),
        Player(name: "Ndr", score: 0),
        Player(name: "Clay", score: 5)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            // $players: bind the array list. $player: each player in players (list)
            Grid {
                GridRow {
                    Text("Name")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .bold()
                
                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
