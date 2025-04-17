//
//  ContentView.swift
//  Birthdays
//
//  Created by Daniel Zhang on 17/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // init variables
    
    // Use query to get model
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    
    // Use environment to modify model data
    @Environment(\.modelContext) private var context
    
    @State private var newName: String = ""
    @State private var newBirthday: Date = Date.now
    
    var body: some View {
        NavigationStack {
            
            // Here is view (Use friends)
            List(friends) { friend in
                HStack {
                    if friend.isbirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text("\(friend.name)")
                        .bold(friend.isbirthdayToday)
                    
                    Spacer()
                    
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        
                        // Here is modify of model data (Use context)
                        context.insert(newFriend)
                        
                        newName = ""
                        newBirthday = Date.now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            
            // SwiftUI begins executing the code in a .task before the view appears.
            .task {
                context.insert(Friend(name: "Zihang", birthday: .now))
                context.insert(Friend(name: "Kexin", birthday: Date(timeIntervalSince1970: 0)))
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
