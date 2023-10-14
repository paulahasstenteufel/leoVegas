//
//  CalculatorViewModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    
    @Published
    var display: String?

    var calculator = Calculator()
    
    //MARK: Internal
    internal var maximumDigits: Int = 0
    internal var clearNext: Bool = false
    
    internal var stackResult: Double?
    internal var nextOperation: Operation?
    internal var nextOperand: Double?
    
    internal var rawInput: String = "" {
        didSet { display = rawInput.isEmpty ? nil : rawInput }
    }
    
    internal var result: Double = 0 {
        didSet { rawInput = result.display }
    }
    
    internal func solve() -> Double? {
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
    
    internal func setResult(stack: Double) {
        guard stack.overflows(maximumDigits) else {
            //TODO: Handle overflow, what is the default calculator behavior?
            return
        }
        
        result = stack
    }
}

extension String {
    var number: Double? {
        try? Double(self, format: .number)
    }
}

extension Double {
    var display: String {
        if truncatingRemainder(dividingBy: 1) == 0 {
            let integerStr = String(format: "%.0f", self)
            return integerStr
        }
        
        return String(self)
    }
    
    func overflows(_ maxDigits: Int) -> Bool {
        self.description.count > maxDigits
    }
}
