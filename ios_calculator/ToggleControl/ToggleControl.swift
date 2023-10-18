//
//  ToggleControl.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 18/10/23.
//

import Foundation

struct ToggleControl {
    
    let operation: Operation
    
    var title: String? {
        switch operation {
        case .add: return "Addition"
        case .subtract: return "Subtraction"
        case .multiply: return "Multiplication"
        case .divide: return "Division"
//        case .sin: return "Toggle Sin"
//        case .cos: return "Toggle Cosin"
        default: return nil
        }
    }
    
    var image: String? {
        switch operation {
        case .add: return "plus.circle.fill"
        case .subtract: return "minus.circle.fill"
        case .multiply: return "multiply.circle.fill"
        case .divide: return "divide.circle.fill"
//        case .sin: return "waveform.path.ecg"
//        case .cos: return "waveform.path"
        default: return nil
        }
    }
}
