//
//  StyledNumber.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct StyledCharacter: View {
    let character: Character
    let color: Color
    
    let font: Font
    
    var width: CGFloat = 0.5
    
    var body: some View {
        ZStack{
                    ZStack{
                        Text(String(character)).font(font).offset(x:  width, y:  width)
                        Text(String(character)).font(font).offset(x: -width, y: -width)
                        Text(String(character)).font(font).offset(x: -width, y:  width)
                        Text(String(character)).font(font).offset(x:  width, y: -width)
                    }
                    .foregroundColor(.white)
            Text(String(character)).font(font).foregroundColor(color)
                }
    }
}

struct StyledCharacter_Previews: PreviewProvider {
    static var previews: some View {
        StyledCharacter(character: "1", color: .red, font: .title)
    }
}
