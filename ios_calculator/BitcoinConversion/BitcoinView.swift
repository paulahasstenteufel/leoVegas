//
//  BitcoinView.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 16/10/23.
//

import SwiftUI

struct BitcoinView: View {
    
    var body: some View {
        Button(action: setResult) {
            iconView
        }
        .fixedSize()
        .onAppear {
            runTask()
        }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var viewModel: CalculatorViewModel
    
    @EnvironmentObject
    private var bitcoinViewModel: BitcoinViewModel
    
    @State
    private var priceFetchingTask: Task<(), Never> = Task { }
    
    private var iconView: some View {
        let colors = bitcoinViewModel.rateAvailable ? enabled : disabled
        return keyView(colors, text: "₿")
    }
    
    
    private func setResult() {
        if let price = bitcoinViewModel.latest, price.updated.inLessThan(300) {
            viewModel.update(with: price.rate)
            return
        }
        
        runTask()
    }
    
    private func fetchPrice() -> Task<(), Never> {
        Task {
            do { try await bitcoinViewModel.getUSDConversionRate() }
            
            catch {
                print(error)
                //TODO: Handle errors
            }
        }
    }
    
    private func runTask() {
        priceFetchingTask.cancel()
        priceFetchingTask = fetchPrice()
    }
}

extension CalculatorViewModel {
    func update(with rate: Double) {
        guard let number = rawInput.number else {
            //TODO: Handle zeroed input
            return
        }
        
        let result = number.bitcoinToUSD(rate: rate)
        display = "USD \(result.display)"
        
        clearStacks()
        clearNext = true
    }
}

extension Double {
    func bitcoinToUSD(rate: Double) -> Double {
        self * rate
    }
}

private extension BitcoinView {
    var enabled: KeyColorSet {
        KeyColorSet(
            foreground: Theme.Feedback.success,
            background: Theme.Neutral.soft,
            text: Theme.Feedback.success
        )
    }
    
    var disabled: KeyColorSet {
        KeyColorSet(
            foreground: Theme.Neutral.strong,
            background: Theme.Neutral.soft,
            text: Theme.Neutral.strong
        )
    }
}
