//
//  Card75.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct Card75: View {
    var value = 75
    
    var body: some View {
        Card(value: value, numbers: [ColoredNumber(number: 7, color: Color("BlueLetter")), ColoredNumber(number: 5, color: .black)], height: 100)
    }
}

struct Card75_Previews: PreviewProvider {
    static var previews: some View {
        Card75()
    }
}
