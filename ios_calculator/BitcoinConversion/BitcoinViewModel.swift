//
//  BitcoinViewModel.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 16/10/23.
//

import Foundation

class BitcoinViewModel: ObservableObject {
    
    @Published
    var rate: Int?
    
    func getUSDConversionRate() async throws {
        do {
            let crypto = try await apiClient.asyncRequest()
            rate = crypto.bitcoin.usd

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
