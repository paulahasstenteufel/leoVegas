//
//  NumberedKeyboardView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 10/10/23.
//

import SwiftUI

struct NumberedKeyboardView: View {
    let viewModel: CalculatorViewModel
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(allKeys, id: \.self) { key in
                GridView(key: key)
                    .onTapGesture {
                        viewModel.tap(key)
                    }
            }
        }
    }
    
    //MARK: Private
    private let columns = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(),
        GridItem()
    ]
    
    private let allKeys = Array(KeyboardKey.allCases)
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
                break
            }
            
        default:
            rawInput += key.rawValue
        }
    }
}

// MARK: Canvas
struct NumberedKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        NumberedKeyboardView(viewModel: viewModel)
    }
    
    private static let viewModel = CalculatorViewModel()
}
