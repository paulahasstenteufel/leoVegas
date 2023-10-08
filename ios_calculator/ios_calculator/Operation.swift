//
//  Operation.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case sin = "sin"
    case cos = "cos"
}

class ToggleManager: ObservableObject {
    let operation: Operation
    
    @Published
    var isEnabled: Bool
    
    init(_ operation: Operation) {
        self.operation = operation
        self.isEnabled = true
    }
}


