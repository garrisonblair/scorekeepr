//
//  ScoreKeeprApp.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

@main
struct ScoreKeeprApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
