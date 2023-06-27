//
//  Card200.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct Card200: View {
    var value = 200
    
    var body: some View {
        Card(value: value, numbers: [ColoredNumber(number: 2, color: Color("RedLetter")), ColoredNumber(number: 0, color: .black), ColoredNumber(number: 0, color: Color("BlueLetter"))], height: 100)
    }
}

struct Card200_Previews: PreviewProvider {
    static var previews: some View {
        Card200()
    }
}
