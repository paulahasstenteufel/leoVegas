//
//  KeyboardView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 10/10/23.
//

import SwiftUI

struct KeyboardView: View {
    
    var body: some View {
        LazyVStack(alignment: .trailing, spacing: 0) {
            supportGrid
                .aspectRatio(5/1, contentMode: .fit)
            
            LazyHStack(alignment: .top, spacing: 0) {
                numbersGrid
                    .aspectRatio(3/4, contentMode: .fit)
                
                fundamentalsGrid
                    .aspectRatio(1/4, contentMode: .fit)
            }
            .aspectRatio(5/4, contentMode: .fit)
        }
        .aspectRatio(contentMode: .fit)
    }
    
    //MARK: Private
    @EnvironmentObject
    private var calculatorViewModel: CalculatorViewModel
    
    @EnvironmentObject
    private var themeManager: ThemeManager
    
    @EnvironmentObject
    private var toggleManager: FeatureToggleManager
    
    private let flexGridItem = GridItem(.flexible(), spacing: 0, alignment: .leading)
    
    private var numbersGrid: some View {
        LazyVGrid(
            columns: [ flexGridItem, flexGridItem, GridItem() ],
            alignment: .trailing,
            spacing: 0,
            content: { DigitsView(keys: calculatorViewModel.keyboardKeys) }
        )
    }
    
    private var fundamentalsGrid: some View {
        LazyVStack(alignment: .trailing, spacing: 0) {
            ForEach(toggleManager.fundamentals, id: \.self) { key in
                keyView(fundamentals, text: key.rawValue)
                    .onTapGesture {
                        calculatorViewModel.tap(key)
                    }
            }
        }
    }
    
    private var supportGrid: some View {
        LazyHStack(alignment: .top, spacing: 0) {
            ForEach(toggleManager.support, id: \.self) { key in
                keyView(support, text: key.rawValue)
                    .onTapGesture {
                        calculatorViewModel.tap(key)
                    }
            }
        }
    }
}

fileprivate extension CalculatorViewModel {
    var keyboardKeys: [Digit] {
        calculator.keyboardKeys
    }
    
    func tap(_ key: Operation) {
        switch key {
        case .clear:
            clearAll()
            
        case .equals:
            if let value = solve() {
                setResult(stack: value)
            }
            
            clearStacks()
            clearNext = true

        default:
            clearNext = true
            
            if let value = solve() {
                setResult(stack: value)
            }
            
            nextOperand = rawInput.number
            nextOperation = key
        }
    }
    
    func clearAll() {
        result = 0
        clearStacks()
    }
}

private extension KeyboardView {
    var fundamentals: KeyColorSet {
        .init(
            foreground: Theme.Neutral.strong,
            background: Theme.Neutral.background,
            text: Theme.Neutral.strong
        )
    }
    
    var support: KeyColorSet {
        .init(
            foreground: themeManager.currentTheme.primaryMedium,
            background: themeManager.currentTheme.primaryLight,
            text: Theme.Neutral.softest
        )
    }
}
