//
//  ColorThemeManager.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 08/10/23.
//

import Foundation

class ThemeManager: ObservableObject {
    
    @Published
    var currentTheme: Theme = .cold
    
    @Published
    var isCold: Bool = true
    
    func toggleTheme() {
        isCold.toggle()
        currentTheme = isCold ? .warm : .cold
    }
}
