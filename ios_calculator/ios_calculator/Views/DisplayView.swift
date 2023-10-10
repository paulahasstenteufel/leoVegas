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
        Text(viewModel.display)
            .font(Fonts.display)
            .lineLimit(1)
            .truncationMode(.tail)
            .overlay {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    
                    Color.clear
//                        .onAppear { Maybe does not need OnAppear
//                            viewModel.calculateMaxDigits(for: width)
//                        }
                        .onChange(of: width) { w in
                            viewModel.calculateMaxDigits(for: width)
                        }
                        
                }
            }
    }
}

extension CalculatorViewModel {
    func calculateMaxDigits(for width: Double) {
        let approxWidth = 100 / 2.0
        let max = floor(width / approxWidth)
        maximumDigits = Int(max)
    }
}
