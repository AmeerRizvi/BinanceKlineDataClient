//
//  BinanceKlineDataClient.swift
//
//  Created by Ameer Rizvi on 2024-02-10.
//

import Foundation

public struct BinanceKlineDataClient {
    public init() {}
    
    private let baseURL = "https://api.binance.com/api/v3/klines"
    private let urlSession = URLSession.shared
    
    @available(macOS 12.0, *)
    private func fetchData(request: URLRequest) async throws -> String {
        let urlRequest = request
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ClientError.dataNotFound
        }
        guard let dataString = String(data: data, encoding: .utf8) else {
            throw ClientError.conversionFailed
        }
        
        return dataString
    }
    
    @available(macOS 12.0, *)
    public func fetchCandles(symbol: String, interval: Int? = 1, limit: Int? = 20) async throws -> [KlineCandleData] {
        
        var urlString = "\(baseURL)?symbol=\(symbol)"
        if let interval = interval {
            urlString += "&interval=\(interval)"
        }
        if let limit = limit {
            urlString += "&limit=\(limit)"
        }
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let urlRequest = URLRequest(url: url)
        let response: String = try await fetchData(request: urlRequest)
        
        var mainKlineData = [KlineCandleData]()
        let jsonData = response.data(using: .utf8)!
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [[Any]]
            for data in jsonArray {
                if let klineData = KlineCandleData(jsonArray: data) {
                    mainKlineData.append(klineData)
                }
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        return mainKlineData
    }
    
}

