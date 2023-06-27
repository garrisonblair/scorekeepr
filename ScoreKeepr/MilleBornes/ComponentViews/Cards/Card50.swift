//
//  Card50.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct Card50: View {
    var value = 50
    
    var body: some View {
        Card(value: value, numbers: [ColoredNumber(number: 5, color: Color("RedLetter")), ColoredNumber(number: 0, color: Color("RedLetter"))], height: 100)
    }
}

struct Card50_Previews: PreviewProvider {
    static var previews: some View {
        Card50()
    }
}
