//
//  CalculatorView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

struct CalculatorView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            DisplayView(viewModel: viewModel)
            
            NumberedKeyboardView(viewModel: viewModel)
        }
    }
    
    //MARK: Private
    @StateObject
    private var viewModel = CalculatorViewModel()
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
