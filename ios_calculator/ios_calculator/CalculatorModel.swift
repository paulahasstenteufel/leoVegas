//
//  CalculatorModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 12/10/23.
//

import Foundation

struct Calculator {
    func solve(input: Double?, nextOperation: OperationKey?, nextOperand: Double?) throws -> Double {
        guard
            let number = input,
            let operation = nextOperation,
            let operand = nextOperand
        else {
            throw CalculationError.missingComponent
        }
        
        return number.perform(operation, by: operand)
    }
}

enum CalculationError: Error {
    case missingComponent
}

fileprivate extension Double {
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
}
