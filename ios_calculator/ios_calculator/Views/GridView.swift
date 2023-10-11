//
//  GridView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

struct GridView: View {
    let key: KeyboardKey
    
    var body: some View {
        ZStack {
            shapeView
            
            Text(key.rawValue)
                .font(Fonts.heading)
                .foregroundColor(key == .comma ? .white : theme.primaryMedium)
                .padding()
        }
        .contentShape(Rectangle())
        .onAppear {
            //TODO: Load user's saved theme?
        }
    }
    
    //MARK: Private
    private let theme = ThemeManager.shared.currentTheme //TODO: Pass down as environmentObj later
    
    @ViewBuilder
    private var shapeView: some View {
        let shape = RoundedRectangle(cornerRadius: Dimension.keyCorner)
        
        switch key {
        case .keypad0:
            shape
                .stroke(lineWidth: Dimension.line)
                .aspectRatio(Dimension.aspectRect, contentMode: .fill)
            
        case .comma:
            shape
                .fill()
                .aspectRatio(Dimension.aspectSquare, contentMode: .fit)
            
        default:
            shape
                .stroke(lineWidth: Dimension.line)
                .aspectRatio(Dimension.aspectSquare, contentMode: .fit)
        }
    }
}
