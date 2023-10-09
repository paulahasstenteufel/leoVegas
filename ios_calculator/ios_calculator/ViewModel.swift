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
    var result: Double = 0
    
    func tap(_ key: OperationKey) {
        switch key {
        
        case .clear:
            clear()
            
        case .equals:
            result = stackOperand
            //TODO: what is the default behaviour after this?
            
        case .add:
            
        case .subtract:
            
        case .multiply:
            
        case .divide:
            
        case .sin:
            
        case .cos:
            
        case .comma:
            
        default:
            let number = key.rawValue
        }
    }
    
    //MARK: Private
    private var stackOperand: Double = 0
    private var tempOperand: String = ""
    
    private func clear() {
        stackOperand = 0
        result = 0
    }
}

extension Double {
    func perform(_ operation: OperationKey, by operand: Double) -> Double {
        switch operation {
        case .add:
            return self + operand
            
        case .subtract:
            return self - operand
            
        case .divide:
            return self / operand
            
        case .multiply:
            return self * operand
            
        case .cos:
            return sin(self)
            
        case .sin:
            return cos(self)
            
        default: break
        }
    }
}
