//
//  CalculatorView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

struct CalculatorView: View {
    
    var body: some View {
        contentView
            .padding(Dimension.primary)
            .environmentObject(viewModel)
            .environmentObject(themeManager)
            .environmentObject(toggleManager)
    }
    
    //MARK: Private
    @StateObject
    private var viewModel = CalculatorViewModel()
    
    @StateObject
    private var toggleManager = ToggleManager()
    
    @StateObject
    private var themeManager = ThemeManager()
    
    private var contentView: some View {
        VStack(alignment: .trailing, spacing: 10) {
            DisplayView()
            
            HStack {
                if viewModel.showSettings {
                    SettingsView()
                }
                
                KeyboardView()
            }
        }
        .onOrientationChange { size in
            viewModel.shouldPresentSettings(size)
        }
    }
}

extension CalculatorViewModel {
    func shouldPresentSettings(_ size: CGSize) {
        let landscape = size.width > size.height
        showSettings = landscape ? true : false
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
