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
    private var viewModel: CalculatorViewModel
    private let flexGridItem = GridItem(.flexible(), spacing: 0, alignment: .leading)
    
    private var numbersGrid: some View {
        LazyVGrid(
            columns: [ flexGridItem, flexGridItem, GridItem() ],
            alignment: .trailing,
            spacing: 0,
            content: { NumbersView(keys: viewModel.keyboardKeys) }
        )
    }
    
    private var fundamentalsGrid: some View {
        LazyVStack(alignment: .trailing, spacing: 0) {
            OperationsView(keys: viewModel.fundamentalKeys)
                .background(Theme.Neutral.background)
                .foregroundColor(Theme.Neutral.strong)
        }
    }
    
    private var supportGrid: some View {
        LazyHStack(alignment: .top, spacing: 0) {
            OperationsView(keys: viewModel.supportKeys)
                .background(Theme.Neutral.strong)
                .foregroundColor(Theme.Neutral.strongest.opacity(0.7))
        }
    }
}

struct NumbersView: View {
    let keys: [Number]
    
    var body: some View {
        ForEach(keys, id: \.self) { key in
            gridItem(for: key)
        }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var viewModel: CalculatorViewModel
    
    private func gridItem(for key: Number) -> some View {
        KeyboardKeyView(key: key)
            .onTapGesture {
                viewModel.tap(key)
            }
    }
}

extension CalculatorViewModel {
    func tap(_ key: Number) {
        switch key {
        case .keypad0:
            if rawInput.first == "0" {
                break
            }
        
        case .comma:
            if rawInput.contains(".") {
                return
            }
            
        case .empty:
            rawInput += "0" //TODO: Replace fix for final solution
            
        default: break
        }
        
        rawInput += key.rawValue
    }
    
    fileprivate var keyboardKeys: [Number] {
        Array(calculator.keyboardKeys)
    }
    
    fileprivate var supportKeys: [Operation] {
        Array(calculator.supportKeys)
    }
    
    fileprivate var fundamentalKeys: [Operation] {
        Array(calculator.fundamentalKeys)
    }
}
