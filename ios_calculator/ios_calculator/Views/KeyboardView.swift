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
            content: { DigitsView(keys: viewModel.keyboardKeys) }
        )
    }
    
    private var fundamentalsGrid: some View {
        LazyVStack(alignment: .trailing, spacing: 0) {
            OperationsView(keys: viewModel.fundamentalKeys)
        }
    }
    
    private var supportGrid: some View {
        LazyHStack(alignment: .top, spacing: 0) {
            OperationsView(keys: viewModel.supportKeys)
        }
    }
}

extension CalculatorViewModel {
    fileprivate var keyboardKeys: [Digit] {
        Array(calculator.keyboardKeys)
    }
    
    fileprivate var supportKeys: [Operation] {
        Array(calculator.supportKeys)
    }
    
    fileprivate var fundamentalKeys: [Operation] {
        Array(calculator.fundamentalKeys)
    }
}
