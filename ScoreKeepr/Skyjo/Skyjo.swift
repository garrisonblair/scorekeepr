//
//  Skyjo.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 10/07/2023.
//

import SwiftUI

struct CardInHand: Identifiable {
    var id = UUID()
    var value: Int
    var isFaceUp: Bool
}

struct Column: Identifiable {
    var id = UUID()
    var cards: [CardInHand]
}

struct SkyjoPlayer: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
    var hand: [Column]
}

struct Skyjo: View {
    @State(initialValue: [-2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12].shuffled()) var deck: [Int]
    
    @State(initialValue: [SkyjoPlayer(name: "", score: 0, hand: []), SkyjoPlayer(name: "", score: 0, hand: [])]) var players: [SkyjoPlayer]
    
    @State(initialValue: []) var discard: [Int]
    
    func deal() {
        players[0].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: true), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        players[0].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: true), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        players[0].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        players[0].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        
        players[1].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: true), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        players[1].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: true), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        players[1].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        players[1].hand.append(Column(cards: [CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false), CardInHand(value: deck.popLast()!, isFaceUp: false)]))
        
        discard.append(deck.popLast()!)
    }

    
    var body: some View {
        ScrollView {
            VStack {
                PlayerHand(name: $players[0].name, score: $players[0].score, hand: $players[0].hand)
                    .rotationEffect(.degrees(180))
                Spacer()
                Deck(deck: $deck, discard: $discard)
                Spacer()
                PlayerHand(name: $players[1].name, score: $players[1].score, hand: $players[1].hand)
            }.onAppear(perform: deal)
        }
        .onAppear(perform: { UIApplication.shared.isIdleTimerDisabled = true
        })
        .onDisappear(perform: {
            UIApplication.shared.isIdleTimerDisabled = false
        })
    }
}

struct Skyjo_Previews: PreviewProvider {
    static var previews: some View {
        Skyjo()
    }
}
