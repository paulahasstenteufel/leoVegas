//
//  Keyboard.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 12/10/23.
//

import SwiftUI

struct KeyColorSet {
    let foregroundColor: Color
    let backgroundColor: Color
    let textColor: Color
    
    init(foreground: Color? = nil, background: Color? = nil, text: Color? = nil) {
        foregroundColor = foreground ?? .clear
        backgroundColor = background ?? .clear
        textColor = text ?? .clear
    }
}

internal extension View {
    var keyShape: some Shape {
        RoundedRectangle(cornerRadius: Dimension.keyCorner)
            .stroke(lineWidth: Dimension.line)
    }
    
    func keyView(_ colors: KeyColorSet, text: String, aspect: CGFloat? = Dimension.aspectSquare) -> some View {
        ZStack {
            keyShape
                .aspectRatio(aspect, contentMode: .fill)
                .background(colors.backgroundColor)
            
            Text(text)
                .foregroundColor(colors.textColor)
                .font(Fonts.heading)
        }
        .foregroundColor(colors.foregroundColor)
        .contentShape(Rectangle())
    }
}
