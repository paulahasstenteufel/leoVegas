//
//  ViewModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    
    @Published
    var result: Double = 0.0

    func perform(operation: CalculatorOperation, operand1: Double, operand2: Double? = nil) { //TODO: Handle Optional
        switch operation {
        case .add:
            result = operand1 + (operand2 ?? 0)
            
        case .subtract:
            result = operand1 - (operand2 ?? 0)
            
        case .divide:
            result = operand1 / (operand2 ?? 0)
            
        case .multiply:
            result = operand1 * (operand2 ?? 0)
            
        case .cos:
            result = sin(operand1)
            
        case .sin:
            result = cos(operand1)
        }
    }
}

