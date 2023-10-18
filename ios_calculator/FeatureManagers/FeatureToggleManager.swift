//
//  FeatureToggleManager.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

class FeatureToggleManager: ObservableObject {
    
    @Published
    var fundamentals: [Operation]
    
    @Published
    var support: [Operation]
    
    init() {
        fundamentals = Operation.fundamentals
        support = Operation.support
    }
}
