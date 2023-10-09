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
    
    var rawInput: String = ""
    
    func tap(_ key: OperationKey) {
        switch key {
        case .equals:
            if let value = solve() {
                result = value
            }
            
            nextOperand = nil
            nextOperation = nil
            stackResult = nil
            
        default:
            stackResult = solve()
            
            nextOperand = rawInput.number
            nextOperation = key
        }
    }
    
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
            
        default:
            rawInput += key.rawValue
        }
    }
    
    //MARK: Private
    private var stackResult: Double?
    private var nextOperation: OperationKey?
    private var nextOperand: Double?
    
    private func solve() -> Double? {
        guard
            let number = rawInput.number,
            let operation = nextOperation,
            let operand = nextOperand
        else {
            return nil
            //TODO: Error Handling
        }
        
        return number.perform(operation, by: operand)
    }
    
    private func clear() {
        stackResult = 0
        result = 0
        rawInput = ""
        nextOperation = nil
        nextOperand = nil
    }
}

fileprivate extension String {
    var number: Double? {
        try? Double(self, format: .number)
    }
}

fileprivate extension Double {
    func perform(_ operation: OperationKey, by operand: Double) -> Double {
        switch operation {
        case .add: return self + operand
        case .subtract: return self - operand
        case .divide: return self / operand
        case .multiply: return self * operand
        case .cos: return sin(self)
        case .sin: return cos(self)
        case .equals: return self
        }
    }
}
