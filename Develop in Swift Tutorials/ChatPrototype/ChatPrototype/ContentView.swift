//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Daniel Zhang on 8/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(Color.green, in: RoundedRectangle(cornerRadius: 6))
            Text("SwiftUI")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 6))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
