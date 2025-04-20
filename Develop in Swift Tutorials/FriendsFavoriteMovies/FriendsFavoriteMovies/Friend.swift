//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Daniel Zhang on 20/4/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Tom"),
        Friend(name: "Ndr"),
        Friend(name: "Cosmic"),
        Friend(name: "Jason"),
        Friend(name: "Wilson"),
        Friend(name: "Wenxuan")
    ]
}
