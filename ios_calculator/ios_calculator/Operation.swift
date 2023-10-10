//
//  Operation.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

enum OperationKey: String {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case sin = "sin"
    case cos = "cos"
    case equals = "="
}

enum KeyboardKey: String {
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
    
    static var allCases: [Self] {
        [
            .keypad7, .keypad8, .keypad9,
            .keypad4, .keypad5, .keypad6,
            .keypad1, .keypad2, .keypad3,
            .keypad0, .comma
        ]
    }
}
