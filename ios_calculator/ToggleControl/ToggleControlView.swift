//
//  ToggleControlView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 18/10/23.
//

import SwiftUI

struct ToggleControlView: View {
    
    @StateObject
    var viewModel: ToggleControlViewModel
    
    var body: some View {
        HStack {
            Button(action: viewModel.toggleFeature) {
                HStack(spacing: 10) {
                    controlIcon
                    controlLabel
                }
                .padding(Dimension.small)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .background(viewModel.enabled ? Theme.Neutral.background : .clear)
        .cornerRadius(8)
    }
    
    //MARK: Private
    @EnvironmentObject
    private var themeManager: ThemeManager
    
    @ViewBuilder
    private var controlIcon: some View {
        if let image = viewModel.control.image {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(viewModel.enabled ? themeManager.currentTheme.primaryDark : .gray)
        }
    }
    
    @ViewBuilder
    private var controlLabel: some View {
//        if let title = viewModel.control.title {
            Text("Toggle")
                .foregroundColor(viewModel.enabled ? Theme.Neutral.strongest : Theme.Neutral.medium)
//        }
    }
}


