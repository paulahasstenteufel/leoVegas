//
//  IconToggleStyle.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 18/10/23.
//

import SwiftUI

struct SymbolToggleStyle: ToggleStyle {
 
    let enabledSystemImage: String
    let disabledSystemImage: String
    let enabledColor: Color
    let disabledColor: Color
    
    init(imageOn: String? = nil, imageOff: String? = nil, colorOn: Color? = nil, colorOff: Color? = nil) {
        enabledSystemImage = imageOn ?? "flame.fill"
        disabledSystemImage = imageOff ?? "snowflake"
        enabledColor = colorOn ?? Theme.Warm.primaryMedium
        disabledColor = colorOff ?? Theme.Cold.primaryLight
    }
 
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: Dimension.primary) {
            configuration.label
 
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? enabledColor : disabledColor)
                .overlay(circleView(configuration))
                .frame(width: 50, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
        .padding()
    }
    
    //MARK: Private
    private func circleView(_ configuration: Configuration) -> some View {
        Circle()
            .fill(.white)
            .padding(3)
            .overlay {
                Image(systemName: configuration.isOn ? enabledSystemImage : disabledSystemImage)
                    .foregroundColor(configuration.isOn ? enabledColor : disabledColor)
            }
            .offset(x: configuration.isOn ? 10 : -10)
    }
}
