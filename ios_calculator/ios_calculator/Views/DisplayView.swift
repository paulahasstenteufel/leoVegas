//
//  DisplayView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import SwiftUI

struct DisplayView: View {
    let viewModel: CalculatorViewModel
    
    var body: some View {
        display
            .lineLimit(1)
            .truncationMode(.tail)
            .overlay {
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    Color.clear
                        .onChange(of: size.width) { width in
                            viewModel.calculateMaxDigits(for: width)
                        }
                }
            }
    }
    
    //MARK: Private
    private let theme = ThemeManager.shared.currentTheme
    
    private var display: some View {
        ZStack(alignment: .trailing) {
            GeometryReader { geometry in
                let size = geometry.size
                
                RoundedRectangle(cornerRadius: Dimension.keyCorner)
                    .stroke(lineWidth: Dimension.line)
                    .foregroundColor(theme.primaryMedium)
//                    .border(Theme.Neutral.soft, width: Dimension.line)
                    .frame(width: .infinity, height: size.height * 0.3)
                
                HStack {
                    Spacer()
//                    Text(viewModel.display)
                    Text("9834510389")
                }
                .font(Fonts.display)
                .padding(Dimension.primary)
                .foregroundColor(Theme.Neutral.strongest)
            }
        }
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
