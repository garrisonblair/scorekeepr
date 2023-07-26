//
//  Deck.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 11/07/2023.
//

import SwiftUI

struct Deck: View {
    @Binding var deck: [Int]
    @Binding var discard: [Int]
    
    var body: some View {
        HStack(spacing: 50.0) {
            SkyjoFaceDownCard(height: 90).rotationEffect(.degrees(90))
                .disabled(deck.count == 0)
                .opacity(deck.count == 0 ? 0 : 1)
            if discard.count > 0 {
                SkyjoCard(value: discard[discard.count - 1], height: 90).rotationEffect(.degrees(90))
            }
        }
    }
}

struct Deck_Previews: PreviewProvider {
    static var previews: some View {
        @State(initialValue: [3, 8, 7, 4, 5, 5, 12, -1]) var deck: [Int]
        @State(initialValue: [3, 3, 4]) var discard: [Int]
        
        Deck(deck: $deck, discard: $discard)
    }
}
