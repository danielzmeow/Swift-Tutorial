//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Daniel Zhang on 15/4/25.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Tom", score: 2),
        Player(name: "Ndr", score: 0),
        Player(name: "Clay", score: 5)
    ]
    
    var state = GameState.setup
    var doesHighestScoreWin: Bool = true
    
    var winners: [Player] {
        guard  state == .gameOver else { return [] }
        
        var winnerScore = 0
        if doesHighestScoreWin {
            winnerScore = Int.min
            for player in players {
                winnerScore = max(player.score, winnerScore)
            }
        } else {
            winnerScore = Int.max
            for player in players {
                winnerScore = min(player.score, winnerScore)
            }
        }
        
        return players.filter { player in
            player.score == winnerScore
        }
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
