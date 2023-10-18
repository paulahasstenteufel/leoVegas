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
    private var toggleManager: FeatureToggleManager
    
    private var themeView: some View {
        Toggle(
            isOn: $themeManager.isCold,
            label: {
                Text("Change Theme Colors")
            }
        )
    }
    
    private func controlView(for operation: Operation) -> some View {
        let model = ToggleControl(operation: operation)
        let viewModel = ToggleControlViewModel(model, manager: toggleManager)

        return ToggleControlView(viewModel: viewModel)
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
