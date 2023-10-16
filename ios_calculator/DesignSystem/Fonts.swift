//
//  Fonts.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

enum Fonts {
    static let heading: Font =  .roboto(.medium, size: 22)
    static let title: Font = .roboto(.medium, size: 18)
    static let detail: Font = .roboto(.regular, size: 16)
    static let caption: Font = .roboto(.medium, size: 16)
    static let sidebar: Font = .roboto(.regular, size: 14)
    static let body: Font = .roboto(.regular, size: 20)
    static let keyboard: Font = .roboto(.regular, size: 50)
    static let display: Font = .system(size: 30, weight: .regular).monospacedDigit() //.roboto(.regular, size: 70)
}

extension Font {
    static func roboto(_ type: Roboto, size: CGFloat) -> Self {
        let font = UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
        return .init(uiFont: font)
    }
    
    private init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}

enum Roboto: String {
    case black = "Roboto-Black"
    case bold = "Roboto-Bold"
    case italic = "Roboto-Italic"
    case light = "Roboto-Light"
    case medium = "Roboto-Medium"
    case regular = "Roboto-Regular"
    case thin = "Roboto-Thin"
}
