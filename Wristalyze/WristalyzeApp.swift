//
//  WristalyzeApp.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/24/22.
//

import SwiftUI

@main
struct WristalyzeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
