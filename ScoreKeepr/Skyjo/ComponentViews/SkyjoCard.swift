//
//  Card.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 10/07/2023.
//

import SwiftUI

// Background shape of card
// Bezier curves are used for rounded corners
struct CardBg: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 10, y: rect.minY + 5))
        path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.minY + 5))
        path.addCurve(to: CGPoint(x: rect.maxX - 5, y: rect.minY + 10), control1: CGPoint(x: rect.maxX - 10 + bezierOffset, y: rect.minY + 5), control2: CGPoint(x: rect.maxX - 5, y: rect.minY + 5 + bezierOffset))
        path.addLine(to: CGPoint(x: rect.maxX - 5, y: rect.maxY - 10))
        path.addCurve(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 5), control1: CGPoint(x: rect.maxX - 5, y: rect.maxY - 5 + bezierOffset), control2: CGPoint(x: rect.maxX - 10 + bezierOffset, y: rect.maxY - 5))
        path.addLine(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 5))
        path.addCurve(to: CGPoint(x: rect.minX + 5, y: rect.maxY - 10), control1: CGPoint(x: rect.minX + 5 + bezierOffset, y: rect.maxY - 5), control2: CGPoint(x: rect.minX + 5, y: rect.maxY - 10 + bezierOffset))
        path.addLine(to: CGPoint(x: rect.minX + 5, y: rect.minY + 10))
        path.addCurve(to: CGPoint(x: rect.minX + 10, y: rect.minY + 5), control1: CGPoint(x: rect.minX + 5, y: rect.minY + 10 - bezierOffset), control2: CGPoint(x: rect.minX + 5 + bezierOffset, y: rect.minY + 5))
        return path
    }
}


struct SkyjoCard: View {
    let value: Int
    let height: CGFloat;
    
    var characters: [Character] {
        Array(String(value))
    }
    
    var bgColor: Color {
        if (value < 0) {
            return Color("PurpleCard")
        }
        if (value == 0) {
            return Color("BlueCard")
        }
        if (value < 5) {
            return Color("GreenCard")
        }
        if (value < 9) {
            return Color("YellowCard")
        }
        return Color("RedCard")
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: height)
                .foregroundColor(Color("LightGray"))
                .shadow(radius: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .overlay(
                    CardBg()
                        .fill(RadialGradient(colors: [.white, bgColor], center: .center, startRadius: 5, endRadius: 45))
                )
            HStack {
                ForEach(characters.indices) {
                    StyledCharacter(character: characters[$0], color: .black,
                                    font: .title)
                }
            }
            
        }
        .frame(maxWidth: 75.0)
    }
}

struct SkyjoCard_Previews: PreviewProvider {
    static var previews: some View {
        SkyjoCard(value: -2, height: 100)
            
    }
}
