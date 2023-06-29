//
//  MilleBornes.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 27/06/2023.
//

import SwiftUI

struct PlayerInfo: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
}

struct MilleBornes: View {
    @State(initialValue: 2) var playerCount: Int
    @State(initialValue: [PlayerInfo(name: "", score: 0), PlayerInfo(name: "", score: 0)]) var players: [PlayerInfo]
    
    var body: some View {
        ScrollView {
            VStack {
                CustomStepper(value: $playerCount, in: (2...4), onIncrement: {
                    players.append(PlayerInfo(name: "", score: 0))
                }, onDecrement: {
                    let _ = players.popLast()
                }) {
                    Text("Players: \(playerCount)")
                }
                .padding(.horizontal, 50.0)
                ForEach($players) { player in
                    Player(name: player.name, score: player.score)
                }
                .padding(.horizontal, 10.0)
            }
        }
        .onAppear(perform: { UIApplication.shared.isIdleTimerDisabled = true
        })
        .onDisappear(perform: {
            UIApplication.shared.isIdleTimerDisabled = false
        })
    }
}

struct MilleBornes_Previews: PreviewProvider {
    static var previews: some View {
        MilleBornes()
    }
}
