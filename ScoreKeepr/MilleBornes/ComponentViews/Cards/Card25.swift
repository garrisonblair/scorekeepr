//
//  Card25.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct Card25: View {
    var value = 25
    
    var body: some View {
        Card(value: value, characters: [ColoredCharacter(character: "2", color: Color("BlueLetter")), ColoredCharacter(character: "5", color: Color("BlueLetter"))], height: 100)
    }
}

struct Card25_Previews: PreviewProvider {
    static var previews: some View {
        Card25()
    }
}
