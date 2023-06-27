//
//  Card.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI
let bezierOffset = 0.552284749831

// Top Green shape of card
// Bezier curves are used for rounded corners
struct Top: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 10, y: rect.minY + 5))
        path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.minY + 5))
        path.addCurve(to: CGPoint(x: rect.maxX - 5, y: rect.minY + 10), control1: CGPoint(x: rect.maxX - 10 + bezierOffset, y: rect.minY + 5), control2: CGPoint(x: rect.maxX - 5, y: rect.minY + 5 + bezierOffset))
        path.addLine(to: CGPoint(x: rect.maxX - 5, y: rect.minY + 45))
        path.addLine(to: CGPoint(x: rect.minX + 5, y: rect.minY + 25))
        path.addLine(to: CGPoint(x: rect.minX + 5, y: rect.minY + 10))
        path.addCurve(to: CGPoint(x: rect.minX + 10, y: rect.minY + 5), control1: CGPoint(x: rect.minX + 5, y: rect.minY + 10 - bezierOffset), control2: CGPoint(x: rect.minX + 5 + bezierOffset, y: rect.minY + 5))
        return path
    }
}

// Bottom Green shape of card
// Bezier curves are used for rounded corners
struct Bottom: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 5))
        path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 5))
        path.addCurve(to: CGPoint(x: rect.maxX - 5, y: rect.maxY - 10), control1: CGPoint(x: rect.maxX - 10 + bezierOffset, y: rect.maxY - 5), control2: CGPoint(x: rect.maxX - 5, y: rect.maxY - 5 + bezierOffset))
        path.addLine(to: CGPoint(x: rect.maxX - 5, y: rect.maxY - 15))
        path.addLine(to: CGPoint(x: rect.minX + 5, y: rect.maxY - 35))
        path.addLine(to: CGPoint(x: rect.minX + 5, y: rect.maxY - 10))
        path.addCurve(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 5), control1: CGPoint(x: rect.minX + 5, y: rect.maxY - 10 + bezierOffset), control2: CGPoint(x: rect.minX + 5 + bezierOffset, y: rect.maxY - 5))
        return path
    }
}

struct ColoredNumber: Identifiable {
    var id = UUID()
    
    let number: Int
    let color: Color
}

struct Card: View {
    let value: Int
    let numbers: [ColoredNumber]
    let height: CGFloat;

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: height)
                .foregroundColor(Color("LightGray"))
                .shadow(radius: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .overlay(
                    Bottom()
                        .fill(Color("GreenBg"))
                )
                .overlay(
                    Top()
                        .fill(Color("GreenBg"))
                )
            HStack {
                ForEach(numbers) { item in
                    StyledNumber(number: item.number, color: item.color,
                                 font: .title2)
                }
            }
            .padding(.top, 10.0)
        }
        .frame(maxWidth: 75.0)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(value: 200, numbers: [ColoredNumber(number: 2, color: Color("RedLetter")), ColoredNumber(number: 0, color: .black), ColoredNumber(number: 0, color: Color("BlueLetter"))], height: 100)
    }
}
