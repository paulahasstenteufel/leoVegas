//
//  DisplayView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

struct DisplayView: View {
    typealias ViewWidthKey = OrientationPreferenceKey<CGFloat>
    
    let viewModel: CalculatorViewModel
    
    var body: some View {
        display
            .lineLimit(1)
            .truncationMode(.tail)
            .onPreferenceChange(ViewWidthKey.self) { width in
                viewModel.calculateMaxDigits(for: width)
            }
    }
    
    //MARK: Private
    private let theme = ThemeManager.shared.currentTheme
    
    private var display: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: Dimension.keyCorner)
                .stroke(lineWidth: Dimension.line)
                .foregroundColor(theme.primaryMedium)
                .frame(maxWidth: .infinity)

            textView
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var textView: some View {
        HStack {
            Spacer()
            Text(viewModel.display)
        }
        .font(Fonts.display)
        .padding(Dimension.primary)
        .foregroundColor(Theme.Neutral.strongest)
        .background(GeometryReader { inner in
            let width = inner.size.width

            Color.clear
                .preference(key: ViewWidthKey.self, value: width)
        })
    }
}

extension CalculatorViewModel {
    func calculateMaxDigits(for width: Double) {
        let approxWidth = 30 / 2.0 //TODO: Get font size dynamically
        let max = floor(width / approxWidth)
        maximumDigits = Int(max)
    }
}

// MARK: Canvas
struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(viewModel: viewModel)
    }
    
    private static let viewModel = CalculatorViewModel()
}
