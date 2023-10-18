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
//                .overlay {
//                    overlay
//                }
        }
        .fixedSize()
        .onAppear {
            runTask()
        }
    }
    
    //MARK: Private
    @EnvironmentObject
    private var calculatorViewModel: CalculatorViewModel
    
    @EnvironmentObject
    private var cryptoViewModel: CryptoViewModel
    
    @State
    private var priceFetchingTask: Task<(), Never> = Task { }
    
    private var iconView: some View {
        let colors = cryptoViewModel.rateAvailable ? enabled : disabled
        return keyView(colors, text: "₿")
    }
    
//    private var overlay: some View {
//        ProgressView()
//            .progressViewStyle(CircularProgressViewStyle())
//            .foregroundColor(Theme.Neutral.strong)
//            .opacity(priceFetchingTask.isCancelled ? 1 : 0)
//            .fixedSize()
//    }
    
    private func setResult() {
        if let price = cryptoViewModel.latest, price.updated.inLessThan(300) {
            calculatorViewModel.update(with: price.rate)
            return
        }
        
        runTask()
    }
    
    private func fetchPrice() -> Task<(), Never> {
        Task {
            do { try await cryptoViewModel.getUSDConversionRate() }
            
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
