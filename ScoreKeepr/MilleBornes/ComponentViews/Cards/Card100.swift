//
//  Card100.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct Card100: View {
    var value = 100
    
    var body: some View {
        Card(value: value, characters: [ColoredCharacter(character: "1", color: .black), ColoredCharacter(character: "0", color: Color("RedLetter")), ColoredCharacter(character: "0", color: Color("BlueLetter"))], height: 100)
    }
}

struct Card100_Previews: PreviewProvider {
    static var previews: some View {
        Card100()
    }
}
