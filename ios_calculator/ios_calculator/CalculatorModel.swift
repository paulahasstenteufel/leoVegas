//
//  CalculatorModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 12/10/23.
//

import Foundation

typealias Operation = Calculator.OperationKey
typealias Digit = Calculator.DigitKey

struct Calculator {
    let fundamentalKeys: [OperationKey] = [ .add, .subtract, .multiply, .divide ]
    let supportKeys: [OperationKey] = [ .clear, .sin, .cos, .equals ]
    
    let keyboardKeys: [DigitKey] = [
        .keypad7, .keypad8, .keypad9,
        .keypad4, .keypad5, .keypad6,
        .keypad1, .keypad2, .keypad3,
        .keypad0, .empty, .comma
    ]
    
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

extension Calculator {
    enum OperationKey: String {
        case add = "+"
        case subtract = "-"
        case multiply = "×"
        case divide = "÷"
        case sin = "sin"
        case cos = "cos"
        case equals = "="
        case clear = "C"
    }

    enum DigitKey: String {
        case keypad0 = "0"
        case keypad1 = "1"
        case keypad2 = "2"
        case keypad3 = "3"
        case keypad4 = "4"
        case keypad5 = "5"
        case keypad6 = "6"
        case keypad7 = "7"
        case keypad8 = "8"
        case keypad9 = "9"
        case comma = "."
        case empty = ""
    }
}

fileprivate extension Double {
    func perform(_ operation: Calculator.OperationKey, by operand: Double) -> Double {
        switch operation {
        case .add: return self + operand
        case .subtract: return self - operand
        case .divide: return self / operand
        case .multiply: return self * operand
        case .cos: return cos(self)
        case .sin: return sin(self)
        case .equals: return self
        case .clear: return 0
        }
    }
}
