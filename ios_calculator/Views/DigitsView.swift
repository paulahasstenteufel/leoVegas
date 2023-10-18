//
//  NumbersView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

struct DigitsView: View {
    let keys: [Digit]
    
    var body: some View {
        ForEach(keys, id: \.self) { key in
            gridItem(for: key)
        }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var calculatorViewModel: CalculatorViewModel
    
    @EnvironmentObject
    private var themeManager: ThemeManager
    
    @ViewBuilder
    private func gridItem(for key: Digit) -> some View {
        let aspect = (key == .keypad0) ? Dimension.aspectRect : nil
        let colorSet = (key == .comma) ? secondary : primary
        
        if case .empty = key {
            keyView(empty, text: key.rawValue)
            
        } else {
            keyView(colorSet, text: key.rawValue, aspect: aspect)
                .onTapGesture {
                    calculatorViewModel.tap(key)
                }
        }
    }
}

extension CalculatorViewModel {
    func tap(_ key: Digit) {
        
        switch key {
        case .keypad0:
            if rawInput.first == "0" {
                break
            }
            
        case .comma:
            if rawInput.contains(".") {
                return
            }
            
//        case .empty:
//            rawInput += "0" //TODO: Replace fix for final solution
            
        default: break
        }
        
        clearInputIfNeeded()
        rawInput += key.rawValue
    }
    
    private func clearInputIfNeeded() {
        if clearNext {
            rawInput = ""
            clearNext.toggle()
        }
    }
}

private extension DigitsView {
    var primary: KeyColorSet {
        .init(
            foreground: themeManager.currentTheme.primaryMedium,
            text: themeManager.currentTheme.primaryMedium
        )
    }
    
    var secondary: KeyColorSet {
        .init(
            foreground: themeManager.currentTheme.primaryMedium,
            background: themeManager.currentTheme.primaryMedium,
            text: Theme.Neutral.softest
        )
    }
    
    var empty: KeyColorSet {
        .init()
    }
}
