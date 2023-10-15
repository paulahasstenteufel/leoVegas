//
//  OperationsView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 12/10/23.
//

import SwiftUI

struct OperationsView: View {
    let keys: [Operation]
    
    var body: some View {
        ForEach(keys, id: \.self) { key in
            
            keyView(colorSet(for: key), text: key.rawValue)
                .onTapGesture {
                    viewModel.tap(key)
                }
        }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var viewModel: CalculatorViewModel
    
    @EnvironmentObject
    private var themeManager: ThemeManager
    
    private func colorSet(for key: Operation) -> KeyColorSet {
        let supportKeys: Set<Operation> = [.clear, .sin, .cos, .equals]
        
        if supportKeys.contains(key) {
            return support
        }
        
        return fundamentals
    }
}

extension CalculatorViewModel {
    func tap(_ key: Operation) {
        switch key {
        case .clear:
            clearAll()
            
        case .equals:
            if let value = solve() {
                setResult(stack: value)
            }
            
            clearStacks()

        default:
            clearNext = true
            
            if let value = solve() {
                setResult(stack: value)
            }
            
            nextOperand = rawInput.number
            nextOperation = key
        }
    }
    
    private func clearStacks() {
        nextOperation = nil
        nextOperand = nil
        stackResult = nil
    }
    
    private func clearAll() {
        result = 0
        clearStacks()
    }
}

private extension OperationsView {
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
