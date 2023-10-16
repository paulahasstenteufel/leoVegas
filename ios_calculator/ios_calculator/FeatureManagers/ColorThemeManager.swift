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
    var isColdTheme: Bool = true
    
    func toggleTheme() {
        currentTheme = isColdTheme ? .warm : .cold
        isColdTheme.toggle()
    }
}
