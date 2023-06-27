//
//  CardRow.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 27/06/2023.
//

import SwiftUI

struct CardRow: View {
    @Binding var score: Int
    @Binding var cardsPlayed: [Int]
    @Binding var num200: Int
    
    var body: some View {
        
        HStack(spacing: 10.0) {
            Card25().onTapGesture {
                onClickCard(cardNumber: 25)
            }
            Card50().onTapGesture {
                onClickCard(cardNumber: 50)
            }
            Card75().onTapGesture {
                onClickCard(cardNumber: 75)
            }
            Card100().onTapGesture {
                onClickCard(cardNumber: 100)
            }
            Card200()
                .onTapGesture {
                    onClickCard(cardNumber: 200)
                }
                .disabled(num200 >= 2)
                .opacity(num200 >= 2 ? 0 : 1)
        }
    }
    
    private func onClickCard(cardNumber: Int) {
        let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        
        self.score += cardNumber
        self.cardsPlayed.append(cardNumber)
        if (cardNumber == 200) {
            self.num200 += 1
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        @State(initialValue: 0) var score: Int
        @State(initialValue: []) var cardsPlayed: [Int]
        @State(initialValue: 0) var num200: Int
        
        CardRow(score: $score, cardsPlayed: $cardsPlayed, num200: $num200)
    }
}
