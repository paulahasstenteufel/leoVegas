//
//  CalculatorView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

struct CalculatorView: View {
    
    var body: some View {
        VStack {
                
        }
    }
    
    //MARK: Private
    @StateObject
    private var viewModel = CalculatorViewModel()
    
    private var inputView: some View {
        HStack {
            Text(viewModel.rawInput)
                .padding(.leading)
            
            Spacer()
            
            Image(systemName: "xmark")
                .padding(.trailing)
                .onTapGesture {
                    viewModel.clear()
                }
        }
        .font(Littera.heading)
        .padding([.top, .bottom], 30)
        .border(Chroma.Neutral.medium, width: 1)
        .cornerRadius(DrawingConstants.cornerRadius)
    }
}
