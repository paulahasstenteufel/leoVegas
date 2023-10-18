//
//  BitcoinViewModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 16/10/23.
//

import Foundation

class BitcoinViewModel: ObservableObject {
    
    @Published
    var rateAvailable: Bool = false
    
    var latest: BitcoinPrice?
    
    @MainActor
    func getUSDConversionRate() async throws {
        do {
            let crypto = try await apiClient.asyncRequest()
            latest = BitcoinPrice(rate: crypto.bitcoin.usd, updated: .now)
            rateAvailable = true

        } catch let error as ApiError {
            throw error

        } catch {
            throw ApiError(
                statusCode: 0,
                message: "Unknown Error"
            )
        }
    }
    
    //MARK: Private
    private let apiClient = ApiClient()
}

struct BitcoinPrice {
    let rate: Double
    let updated: Date
    let currency: Currency = .usd
    
    enum Currency {
        case usd
    }
}

extension Date {
    func inLessThan(_ seconds: Double) -> Bool {
        let now = Date()
        let timeInterval = now.timeIntervalSince(self)
        
        return timeInterval < seconds
    }
}
