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
        Card(value: value, numbers: [ColoredNumber(number: 1, color: .black), ColoredNumber(number: 0, color: Color("RedLetter")), ColoredNumber(number: 0, color: Color("BlueLetter"))], height: 100)
    }
}

struct Card100_Previews: PreviewProvider {
    static var previews: some View {
        Card100()
    }
}
