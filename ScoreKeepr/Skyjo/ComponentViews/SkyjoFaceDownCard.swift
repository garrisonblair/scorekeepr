//
//  SkyjoFaceDownCard.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 10/07/2023.
//

import SwiftUI

struct SkyjoFaceDownCard: View {
    let height: CGFloat;
    
    var characters = Array("SKYJO")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: height)
                .foregroundColor(Color("LightGray"))
                .shadow(radius: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .overlay(
                    CardBg()
                        .fill(AngularGradient(colors: [Color("PurpleCard"), Color("BlueCard"), Color("GreenCard"), Color("YellowCard"), Color("RedCard"), Color("PurpleCard")], center: .center, startAngle: .degrees(0), endAngle: .degrees(342)))
                )
            HStack {
                ForEach(characters.indices) {
                    StyledCharacter(character: characters[$0], color: .black,
                                    font: .footnote)
                }
            }
            .rotationEffect(.degrees(-45))
        }
        .frame(maxWidth: 75.0)
    }}

struct SkyjoFaceDownCard_Previews: PreviewProvider {
    static var previews: some View {
        SkyjoFaceDownCard(height: 100)
    }
}
