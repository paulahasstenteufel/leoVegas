//
//  ColorThemeManager.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 08/10/23.
//

import Foundation

class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    @Published
    var currentTheme: Theme = .cold
    
    func toggleTheme() {
        currentTheme = isColdTheme ? .warm : .cold
    }
    
    //MARK: Private
    private var isColdTheme: Bool {
        currentTheme == .cold
    }
}
    
//    Button("Switch Theme") {
//        themeManager.switchTheme()
//    }
