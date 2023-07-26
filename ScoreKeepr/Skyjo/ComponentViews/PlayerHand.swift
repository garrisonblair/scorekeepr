//
//  PlayerHand.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 11/07/2023.
//

import SwiftUI

struct PlayerHand: View {
    @Binding var name: String
    @Binding var score: Int
    @Binding var hand: [Column]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(hand) { column in
                    VStack {
                        ForEach(column.cards) { item in
                            if (item.isFaceUp) {
                                SkyjoCard(value: item.value, height: 90)
                                    .padding(.bottom, 5.0)
                            } else {
                                SkyjoFaceDownCard(height: 90)
                            }
                        }
                    }
                }
            }
            HStack(alignment: .center) {
                TextField("Player name", text: $name)
                    .frame(width: 100.0)
                Spacer()
                Text(String(score))
            }
            .padding(.horizontal, 40.0)
        }
    }
}

struct PlayerHand_Previews: PreviewProvider {
    static var previews: some View {
        @State(initialValue: "") var name: String
        @State(initialValue: 0) var score: Int
        @State(initialValue: [
            Column(cards:
            [CardInHand(value: 2, isFaceUp: true), CardInHand(value: 4, isFaceUp: false), CardInHand(value: 12, isFaceUp: false)]),
            Column(cards: [CardInHand(value: 0, isFaceUp: true), CardInHand(value: 4, isFaceUp: false), CardInHand(value: 12, isFaceUp: false)]),
            Column(cards: [CardInHand(value: -2, isFaceUp: false), CardInHand(value: 4, isFaceUp: false), CardInHand(value: 12, isFaceUp: false)]),
            Column(cards: [CardInHand(value: 5, isFaceUp: false), CardInHand(value: 4, isFaceUp: false), CardInHand(value: 12, isFaceUp: false)]),
        ]) var hand: [Column]
        
        PlayerHand(name: $name, score: $score, hand: $hand)
    }
}
