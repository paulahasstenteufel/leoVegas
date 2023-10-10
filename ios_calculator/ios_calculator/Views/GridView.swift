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
            switch key {
            case .keypad0:
                shape
                    .stroke(lineWidth: Dimension.line)
                    .aspectRatio(Dimension.aspectRect, contentMode: .fill)
                
                Text(key.rawValue)
                    .padding()
                
            case .comma:
                shape
                    .fill()
                    .aspectRatio(Dimension.aspectSquare, contentMode: .fit)
                
                Text(key.rawValue)
                    .foregroundColor(.white)
                
            case .empty:
                EmptyView()
                
            default:
                shape
                    .stroke(lineWidth: Dimension.line)
                    .aspectRatio(Dimension.aspectSquare, contentMode: .fit)
                
                Text(key.rawValue)
                    .padding()
            }
        }
        .font(Fonts.heading)
//        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .foregroundColor(ThemeManager.shared.currentTheme.primaryMedium)
        .onAppear {
            //TODO: Load user's saved theme?
        }
    }
    
    //MARK: Private
    private let shape = RoundedRectangle(cornerRadius: Dimension.keyCorner)
}
