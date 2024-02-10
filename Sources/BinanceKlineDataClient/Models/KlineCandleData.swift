//
//  KlineCandleData.swift
//
//
//  Created by Ameer Rizvi on 2024-02-11.
//

import Foundation

public struct KlineCandleData {
    let openTime: Int
    let openPrice: String
    let highPrice: String
    let lowPrice: String
    let closePrice: String
    let volume: String
    let closeTime: Int
    let quoteAssetVolume: String
    let numberOfTrades: Int
    let takerBuyBaseAssetVolume: String
    let takerBuyQuoteAssetVolume: String
    let unusedField: String
    
    init?(jsonArray: [Any]) {
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

