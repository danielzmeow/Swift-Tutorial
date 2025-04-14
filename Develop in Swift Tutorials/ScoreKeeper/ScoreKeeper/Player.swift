//
//  Player.swift
//  ScoreKeeper
//
//  Created by Daniel Zhang on 14/4/25.
//

import Foundation

struct Player: Identifiable {
    // set an id for Identifiable type
    let id = UUID()
    
    var name: String
    var score: Int
}
