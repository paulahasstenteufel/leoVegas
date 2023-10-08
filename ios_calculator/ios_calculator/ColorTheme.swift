//
//  ColorTheme.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

enum Theme: String {
    case light, dark
    
    var backgroundColor: Color {
        switch self {
        case .light:
            return Color.white
        case .dark:
            return Color.black
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .light:
            return Color.white
        case .dark:
            return Color.black
        }
    }
}
