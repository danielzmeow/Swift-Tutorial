//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Daniel Zhang on 23/4/25.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    // @Bindable creates a two-way binding, allowing UI elements to directly modify the friend's properties.
    @Bindable var friend: Friend
    let isNew: Bool
    
    // Environment variable to dismiss the current view presentation.
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    // Query to fetch all movies from the model context, sorted by title.
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favourite Movie", selection: $friend.favouriteMovie) {
                Text("None")
                    .tag(nil as Movie?)
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : friend.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    // Provide the model container with sample data for the preview environment.
    .modelContainer(SampleData.shared.modelContainer)
}
