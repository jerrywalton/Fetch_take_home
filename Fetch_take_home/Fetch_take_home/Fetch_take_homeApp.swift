//
//  Fetch_take_homeApp.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//

import SwiftUI
import SwiftData

@main
struct Fetch_take_homeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            //ContentView()
            RecipeListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
