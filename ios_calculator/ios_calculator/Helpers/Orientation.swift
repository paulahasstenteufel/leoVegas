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
                Color.clear.preference(
                        key: OrientationPreferenceKey.self,
                        value: .init(width: size.width, height: size.height)
                    )
            })
    }
}

extension View {
    func onSizeChange(action: @escaping (CGSize) -> Void) -> some View {
        self.modifier(SizeChange(action: action))
    }
}
