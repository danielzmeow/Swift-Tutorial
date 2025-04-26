//
//  Friends.swift
//  Birthdays
//
//  Created by Daniel Zhang on 17/4/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    
    var isbirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
