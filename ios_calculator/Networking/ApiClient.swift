//
//  ApiClient.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 16/10/23.
//

import Foundation

class ApiClient {
    
    func asyncRequest() async throws -> CryptoResponse {
        do {
            let session = URLSession(configuration: .default)
            let (data, response) = try await session.data(for: urlRequest())
            return try self.manageResponse(data: data, response: response)
            
        } catch {
            throw ApiError(
                statusCode: 0,
                message: "Unknown API error \(error.localizedDescription)"
            )
        }
    }
    
    //MARK: Private
    private func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw ApiError(
                statusCode: 0,
                message: "Invalid HTTP response"
            )
        }
        
        switch response.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
                
            } catch {
                throw ApiError(
                    statusCode: response.statusCode,
                    message: "Error decoding data"
                )
            }
            
        default:
            
            throw ApiError(
                statusCode: response.statusCode,
                message: "Non-2xx error"
            )
        }
    }
}

private extension ApiClient {
    var urlString: String {
        "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
    }
    
    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            throw ApiError(
                statusCode: 0,
                message: "URL error"
            )
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }
}

struct ApiError: Error {
    let statusCode: Int
    let message: String
    
    init(statusCode: Int, message: String) {
        self.statusCode = statusCode
        self.message = message
    }
}

struct CryptoResponse: Codable {
    let bitcoin: BitcoinConversionRate
}

struct BitcoinConversionRate: Codable {
    let usd: Int
}
