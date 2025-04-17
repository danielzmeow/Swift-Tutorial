//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Daniel Zhang on 17/4/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
