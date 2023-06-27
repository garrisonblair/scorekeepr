//
//  Player.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 27/06/2023.
//

import SwiftUI

struct Player: View {
    @State(initialValue: 0) var score: Int
    @State(initialValue: []) var cardsPlayed: [Int]
    @State(initialValue: 0) var num200: Int
    
    @State(initialValue: "") var name: String
    
    var statusColor: Color {
        if (score == 1000) {
            return .green
        }
        if (score > 1000) {
            return .orange
        }
        return Color("CardColor")
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(statusColor)
            VStack {
                HStack() {
                    TextField("Player name", text: $name)
                        .frame(width: 100.0)
                    Spacer()
                    Text(String(score))
                        .font(.largeTitle)
                    Spacer()
                    Button("Undo", role: .cancel, action: {
                        let cardToUndo = self.cardsPlayed.popLast()
                        self.score -= cardToUndo ?? 0
                        if (cardToUndo == 200) {
                            self.num200 -= 1
                        }
                        
                    })
                    .opacity(name.isEmpty ? 0 : 1)
                    .disabled(cardsPlayed == [])
                    Button("Reset", role: .destructive, action: {
                        self.score = 0
                        self.cardsPlayed = []
                        self.num200 = 0
                    })
                    .opacity(name.isEmpty ? 0 : 1)
                    .disabled(cardsPlayed == [])
                }
                CardRow(score: $score, cardsPlayed: $cardsPlayed, num200: $num200).opacity(name.isEmpty ? 0 : 1)
            }.padding(.all, 10.0)
        }
    }
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}
