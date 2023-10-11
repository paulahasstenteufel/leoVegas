//
//  Orientation.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 10/10/23.
//

import SwiftUI

struct OrientationPreferenceKey<T>: PreferenceKey where T: Comparable {
    static var defaultValue: T { fatalError("Provide a default value when using") }
    
    static func reduce(value: inout T, nextValue: () -> T) {
        value = max(value, nextValue())
    }
}
