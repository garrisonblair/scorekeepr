//
//  ContentView.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI
import CoreData

struct Game: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
//    var menu: Menu
}

var games = [
    Game(title: "Mille Bornes", icon: "mille_bornes_logo")
]

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationStack {
            List(games) { game in
                NavigationLink(value: game) {
                    Label(game.title, image: game.icon)
                }
            }
            .navigationTitle("ScoreKeepr")
            .navigationDestination(for: Game.self) { game in
                if (game.title == "Mille Bornes") {
                    MilleBornes()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
