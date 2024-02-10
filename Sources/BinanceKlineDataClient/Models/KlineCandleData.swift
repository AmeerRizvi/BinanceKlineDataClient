//
//  KlineCandleData.swift
//
//
//  Created by Ameer Rizvi on 2024-02-11.
//

import Foundation

public struct KlineCandleData {
    public let openTime: Int
    public let openPrice: String
    public let highPrice: String
    public let lowPrice: String
    public let closePrice: String
    public let volume: String
    public let closeTime: Int
    public let quoteAssetVolume: String
    public let numberOfTrades: Int
    public let takerBuyBaseAssetVolume: String
    public let takerBuyQuoteAssetVolume: String
    public let unusedField: String
    
    public init?(jsonArray: [Any]) {
        guard jsonArray.count == 12 else { return nil }
        self.openTime = jsonArray[0] as? Int ?? 0
        self.openPrice = jsonArray[1] as? String ?? ""
        self.highPrice = jsonArray[2] as? String ?? ""
        self.lowPrice = jsonArray[3] as? String ?? ""
        self.closePrice = jsonArray[4] as? String ?? ""
        self.volume = jsonArray[5] as? String ?? ""
        self.closeTime = jsonArray[6] as? Int ?? 0
        self.quoteAssetVolume = jsonArray[7] as? String ?? ""
        self.numberOfTrades = jsonArray[8] as? Int ?? 0
        self.takerBuyBaseAssetVolume = jsonArray[9] as? String ?? ""
        self.takerBuyQuoteAssetVolume = jsonArray[10] as? String ?? ""
        self.unusedField = jsonArray[11] as? String ?? ""
    }
}

