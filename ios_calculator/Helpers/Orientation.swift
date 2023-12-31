//
//  Orientation.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 10/10/23.
//

import SwiftUI

struct OrientationPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize { .init(width: 0, height: 0) }

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        let next = nextValue()
        
        guard value.hasChangedOrientation(to: next) else {
            return
        }
        
        value.width = max(value.width, next.width)
        value.height = max(value.height, next.height)
    }
}

struct SizeChange: ViewModifier {
    var action: (CGSize) -> Void
    
    func body(content: Content) -> some View {
        content
            .background(GeometryReader { inner in
                let size = inner.size
                Color.clear
                    .onAppear { action(size) }
                    .preference(
                        key: OrientationPreferenceKey.self,
                        value: .init(width: size.width, height: size.height)
                    )
                    .onPreferenceChange(OrientationPreferenceKey.self) { size in
                        action(size)
                    }
            })
    }
}

extension View {
    //TODO: Needs renaming after onAppear implementation.
    func onOrientationChange(action: @escaping (CGSize) -> Void) -> some View {
        self.modifier(SizeChange(action: action))
    }
}

fileprivate extension CGSize {
    func hasChangedOrientation(to next: CGSize) -> Bool {
        return self.isLandscape != next.isLandscape
    }
    
    var isLandscape: Bool {
        return self.width > self.height
    }
}
