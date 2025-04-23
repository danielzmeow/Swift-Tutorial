//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Daniel Zhang & Claude 3.7 on 20/4/25.
//

import Foundation
import SwiftData

// The @MainActor attribute ensures all operations are performed on the main thread
@MainActor
class SampleData {
    // Shared singleton instance providing global access to the data layer
    static let shared = SampleData()
    // The model container that manages the persistent store and model schema
    let modelContainer: ModelContainer
    
    // Provides access to the main context for performing data operations (create, read, update, delete)
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    // Private initializer to enforce singleton pattern. Sets up the data model schema and configuration.
    private init() {
        // Define the schema with all model classes that need to be stored
        let schema = Schema([
            Friend.self,  // Friend model class
            Movie.self    // Movie model class
        ])
        
        // Configure the model storage behavior
        // Here we're using in-memory storage which doesn't persist data to disk
        let modelConfig = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true  // Data will be lost when the app terminates
        )
        
        do {
            // Create the model container with the defined schema and configuration
            // This is where potential errors might occur (file system issues, model incompatibilities)
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfig])
            insertSampleData()
            try context.save()
        } catch {
            // If container creation fails, terminate the app with an error message
            // In production apps, you might want more graceful error handling
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    
    // SwiftData can automatically identify type of data registed in schema and insert them with proper type.
    private func insertSampleData() {
        for sampleFriend in Friend.sampleData {
            context.insert(sampleFriend)
        }
        
        for sampleMovie in Movie.sampleData {
            context.insert(sampleMovie)
        }
    }
}
