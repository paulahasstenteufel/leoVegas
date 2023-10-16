//
//  SettingsView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 14/10/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: Dimension.keyCorner)
                .stroke(lineWidth: Dimension.line)
                .foregroundColor(Theme.Neutral.medium)
                .background(Theme.Neutral.background)

            HStack(alignment: .bottom, spacing: 10) {
                SectionView(title: "Theme Manager") {
                    themeView
                        .onTapGesture {
                            themeManager.toggleTheme()
                        }
                }
                
                SectionView(title: "Calculator Manager") {
                    VStack {
                        ForEach(Operation.fundamentals, id: \.self) { operation in
                            controlView(for: operation)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    //MARK: Private
    @EnvironmentObject
    private var themeManager: ThemeManager
    
    @EnvironmentObject
    private var toggleManager: ToggleManager
    
    private var themeView: some View {
        Toggle(
            isOn: $themeManager.isCold,
            label: {
                Text("Change Theme Colors")
            }
        )
    }
    
    private func controlView(for operation: Operation) -> some View {
        let model = Control(operation: operation)
        let viewModel = ControlViewModel(model, manager: toggleManager)

        return ControlView(viewModel: viewModel)
    }
}

struct SectionView<Content: View>: View {
    let title: String
    let content: () -> Content
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: Dimension.keyCorner)
                .stroke(lineWidth: Dimension.line)
                .foregroundColor(Theme.Neutral.background)
                .background(Theme.Neutral.soft)

            titleView
        }
        .padding(Dimension.small)
    }
    
    //MARK: Private
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(Fonts.heading)
                .padding()
            
            content()
        }
    }
}

struct ControlView: View {
    
    @StateObject
    var viewModel: ControlViewModel
    
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


