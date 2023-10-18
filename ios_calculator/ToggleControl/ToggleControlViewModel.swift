//
//  ToggleControlViewModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 18/10/23.
//

import SwiftUI

class ToggleControlViewModel: ObservableObject {
    
    @Published
    var enabled: Bool = true
    
    @ObservedObject
    var toggleManager: FeatureToggleManager
    
    let control: ToggleControl
    
    init(_ model: ToggleControl, manager: FeatureToggleManager) {
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
