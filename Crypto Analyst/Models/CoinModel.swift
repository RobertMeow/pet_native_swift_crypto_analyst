//
//  CoinModel.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import Foundation

struct Coin: Identifiable, Decodable {
    let id: UUID = UUID()
    let coin_name: String
    let current_price: Double
    let icon_url: String
    let recommendation: String
    
    enum CodingKeys: String, CodingKey {
        case coin_name
        case current_price
        case icon_url
        case recommendation
    }
}
