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
            .environmentObject(calculatorViewModel)
            .environmentObject(cryptoViewModel)
            .environmentObject(themeManager)
            .environmentObject(toggleManager)
    }
    
    //MARK: Private
    @StateObject
    private var calculatorViewModel = CalculatorViewModel()
    
    @StateObject
    private var cryptoViewModel = CryptoViewModel()
    
    @StateObject
    private var toggleManager = ToggleManager()
    
    @StateObject
    private var themeManager = ThemeManager()
    
    private var contentView: some View {
        VStack(alignment: .trailing, spacing: 10) {
            displayView
            
            HStack {
                if calculatorViewModel.showSettings {
                    SettingsView()
                }
                
                KeyboardView()
            }
        }
        .onOrientationChange { size in
            calculatorViewModel.shouldPresentSettings(size)
        }
    }
    
    private var displayView: some View {
        HStack(spacing: 10) {
            DisplayView()
            
            BitcoinView()
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
