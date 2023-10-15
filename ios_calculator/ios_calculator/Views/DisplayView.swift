//
//  DisplayView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

struct DisplayView: View {
    var body: some View {
        display
            .lineLimit(1)
            .truncationMode(.tail)
            .onOrientationChange { size in
                viewModel.calculateMaxDigits(for: size.width)
            }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var viewModel: CalculatorViewModel
    
    private var display: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: Dimension.keyCorner)
                .stroke(lineWidth: Dimension.line)
                .foregroundColor(Theme.Neutral.medium)

            textView
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var textView: some View {
        Text(viewModel.display ?? "0")
            .font(Fonts.display)
            .padding(Dimension.small)
            .foregroundColor(Theme.Neutral.strongest)
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
        DisplayView()
    }
}
