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
        VStack(alignment: .leading){
            Text("Score Keeper")
                .bold()
                .font(.title)

                // $players: bind the array list. $player: each player in players (list)
            List {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Score")
                }
                .bold()
                    
                ForEach($players) { $player in
                    HStack {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                            .padding(.trailing)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
                .onDelete{ players.remove(atOffsets: $0) }
                .onMove{ players.move(fromOffsets: $0, toOffset: $1) }
                
                Button("Add Player", systemImage: "plus") {
                    players.append(Player(name: "", score: 0))
                }
                .labelStyle(.titleOnly)
                
                EditButton()
            }
            .listStyle(.insetGrouped)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
