//
//  StyledNumber.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 26/06/2023.
//

import SwiftUI

struct StyledNumber: View {
    let number: Int
    let color: Color
    
    let font: Font
    
    var width: CGFloat = 0.5
    
    var body: some View {
        ZStack{
                    ZStack{
                        Text(String(number)).font(font).offset(x:  width, y:  width)
                        Text(String(number)).font(font).offset(x: -width, y: -width)
                        Text(String(number)).font(font).offset(x: -width, y:  width)
                        Text(String(number)).font(font).offset(x:  width, y: -width)
                    }
                    .foregroundColor(.white)
            Text(String(number)).font(font).foregroundColor(color)
                }
    }
}

struct StyledNumber_Previews: PreviewProvider {
    static var previews: some View {
        StyledNumber(number: 1, color: .red, font: .title)
    }
}
