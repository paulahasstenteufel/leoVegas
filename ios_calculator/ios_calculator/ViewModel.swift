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
    var display: String = ""
    
    func tap(_ key: OperationKey) {
        switch key {
        case .equals:
            if let value = solve() {
                setResult(stack: value)
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
    
    //MARK: Private
    internal var maximumDigits: Int = 0
    
    private var stackResult: Double?
    private var nextOperation: OperationKey?
    private var nextOperand: Double?
    
    internal var rawInput: String = ""
    private var result: Double = 0 {
        didSet {
            display = result.display
        }
    }
    
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
    
    private func setResult(stack: Double) {
        guard stack.overflows(maximumDigits) else {
            //TODO: Handle overflow, what is the default calculator behavior?
            return
        }
        
        result = stack
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
    var display: String {
        String(self)
    }
    
    func perform(_ operation: OperationKey, by operand: Double) -> Double {
        switch operation {
        case .add: return self + operand
        case .subtract: return self - operand
        case .divide: return self / operand
        case .multiply: return self * operand
        case .cos: return cos(self)
        case .sin: return sin(self)
        case .equals: return self
        }
    }
    
    func overflows(_ maxDigits: Int) -> Bool {
        self.description.count > maxDigits
    }
}
