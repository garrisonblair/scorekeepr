//
//  MilleBornes.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 27/06/2023.
//

import SwiftUI

struct MilleBornes: View {
    @State(initialValue: 2) var playerCount: Int
    
    var body: some View {
        ScrollView {
            VStack {
                Stepper(value: $playerCount, in: (2...4)) {
                    Text("Players: \(playerCount)")
                }
                .padding(.horizontal, 50.0)
                ForEach((1...playerCount), id: \.self) {_ in
                        Player()
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
