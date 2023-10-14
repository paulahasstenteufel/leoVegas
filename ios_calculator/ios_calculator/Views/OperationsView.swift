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
        if let value = solve() {
            setResult(stack: value)
            stackResult = value
        }

        switch key {
        case .equals:
            clearStacks()

        default:
            nextOperand = rawInput.number
            nextOperation = key
        }
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
            foreground: Theme.Neutral.strongest,
            background: Theme.Neutral.strong,
            text: Theme.Neutral.softest
        )
    }
}
