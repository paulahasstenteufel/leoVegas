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
    var display: String?
    
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
    private var calculator = Calculator()
    
    internal var maximumDigits: Int = 0
    private var stackResult: Double?
    private var nextOperation: OperationKey?
    private var nextOperand: Double?
    
    var rawInput: String = "" {
        didSet { display = rawInput.isEmpty ? nil : rawInput }
    }
    
    private var result: Double = 0 {
        didSet { rawInput = result.display }
    }
    
    private func solve() -> Double? {
        do {
            return try calculator.solve(
                input: rawInput.number,
                nextOperation: nextOperation,
                nextOperand: nextOperand
            )
            
        } catch {
            //TODO: Handle error
            return nil
        }
    }
    
    private func setResult(stack: Double) {
        guard stack.overflows(maximumDigits) else {
            //TODO: Handle overflow, what is the default calculator behavior?
            return
        }
        
        result = stack
    }
    
    private func clearAll() {
        stackResult = 0
        result = 0
        rawInput = "0"
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
    
    func overflows(_ maxDigits: Int) -> Bool {
        self.description.count > maxDigits
    }
}
