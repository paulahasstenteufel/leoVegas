//
//  CalculatorView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

struct CalculatorView: View {
    
    var body: some View {
    @StateObject
    private var themeManager = ThemeManager()
        
        VStack(alignment: .trailing, spacing: 10) {
            
            DisplayView()
            
            KeyboardView()
        }
        .padding(Dimension.primary)
        .environmentObject(viewModel)
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
