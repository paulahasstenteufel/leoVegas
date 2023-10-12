//
//  NumberedKeyboardView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 10/10/23.
//

import SwiftUI

struct NumberedKeyboardView: View {
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .trailing, spacing: 0) {
            ForEach(allKeys, id: \.self) { key in
                gridItem(for: key)
                    .padding(.horizontal, -4)
            }
        }
        .aspectRatio(3/4, contentMode: .fit)
    }
    
    //MARK: Private
    @EnvironmentObject
    private var viewModel: CalculatorViewModel
    
    private let allKeys = Array(KeyboardKey.allCases)
    private let columns = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(),
        GridItem(.flexible(), alignment: .leading)
    ]
    
    private func gridItem(for key: KeyboardKey) -> some View {
        KeyboardKeyView(key: key)
            .onTapGesture {
                viewModel.tap(key)
            }
    }
}

extension CalculatorViewModel {
    func tap(_ key: KeyboardKey) {
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
}

// MARK: Canvas
struct NumberedKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        NumberedKeyboardView()
    }
}
