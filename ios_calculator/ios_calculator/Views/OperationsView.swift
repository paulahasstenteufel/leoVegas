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
            gridItem(for: key)
                .onTapGesture {
                    viewModel.tap(key)
                }
        }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var viewModel: CalculatorViewModel
    
    private func gridItem(for key: Operation) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: Dimension.keyCorner)
                .stroke(lineWidth: Dimension.line)
                .aspectRatio(Dimension.aspectSquare, contentMode: .fill)

            Text(key.rawValue)
                .font(Fonts.heading)
                .foregroundColor(keys.contains { $0 == .clear || $0 == .sin || $0 == .cos || $0 == .equals } ? .white : Theme.Neutral.strong)
        }
        .contentShape(Rectangle())
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
