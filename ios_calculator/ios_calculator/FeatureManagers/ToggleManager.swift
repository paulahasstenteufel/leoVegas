//
//  OperationToggleManager.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

class ToggleManager: ObservableObject {
    
    @Published
    var fundamentals: [Operation]
    
    @Published
    var support: [Operation]
    
    init() {
        fundamentals = Operation.fundamentals
        support = Operation.support
    }
}

class ControlViewModel: ObservableObject {
    
    @Published
    var enabled: Bool = true
    
    @ObservedObject
    var toggleManager: ToggleManager
    
    let control: Control
    
    init(_ model: Control, manager: ToggleManager) {
        self.control = model
        self.toggleManager = manager
    }
    
    func toggleFeature() {
        enabled.toggle()
        
        if enabled {
            insert()
            
        } else {
            remove()
        }
    }
    
    //MARK: Private
    private func insert() {
        if toggleManager.fundamentals.firstIndex(of: control.operation) == nil {
            toggleManager.fundamentals.append(control.operation)
        }
    }
    
    private func remove() {
        if let index = toggleManager.fundamentals.firstIndex(of: control.operation) {
            toggleManager.fundamentals.remove(at: index)
        }
    }
}

struct Control {
    let operation: Operation
    
    var title: String? {
        switch operation {
        case .add: return "Toggle Addition"
        case .subtract: return "Toggle Subtraction"
        case .multiply: return "Toggle Multiplication"
        case .divide: return "Toggle Division"
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
