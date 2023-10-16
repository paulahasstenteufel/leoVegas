//
//  BitcoinView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 16/10/23.
//

import SwiftUI

struct BitcoinView: View {
    
    var body: some View {
        Button {
            Task.init { await update() }
            
        } label: {
            iconView
        }
    }
    
    //MARK: Private
    @StateObject
    private var viewModel = BitcoinViewModel()
    
    private var iconView: some View {
        let colors = KeyColorSet(
            foreground: Theme.Neutral.strongest,
            background: Theme.Neutral.soft,
            text: Theme.Neutral.strongest
        )
        
        return keyView(colors, text: "₿")
    }
    
    private func update() async {
        do {
            try await viewModel.getUSDConversionRate()
            
        } catch {
            print(error)
            //TODO: Add error handling
        }
    }
}
