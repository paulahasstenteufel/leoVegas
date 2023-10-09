//
//  OperationToggleManager.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import Foundation

class OperationToggleManager: ObservableObject {
    static let shared = OperationToggleManager()
    
    @Published
    var addition = Control(.add)
    
    @Published
    var subtraction = Control(.subtract)
    
    @Published
    var division = Control(.divide)
    
    @Published
    var multiplication = Control(.multiply)
    
    @Published
    var sin = Control(.sin)
    
    @Published
    var cos = Control(.cos)
}

extension OperationToggleManager {
    class Control {
        
        @Published
        var isEnabled: Bool
        
        init(_ operation: OperationKey) {
            self.operation = operation
            self.isEnabled = true
        }
        
        func toggleFeature() {
            isEnabled.toggle()
            //TODO: Probably won't need method, just listening to the publisher
        }
        
        //MARK: Private
        private let operation: OperationKey
    }
}

//    Button("Toggle Operation") {
//        toggleManager.switchTheme()
//    }
