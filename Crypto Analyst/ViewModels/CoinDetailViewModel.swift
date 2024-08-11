//
//  CoinDetailViewModel.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import Foundation

class CoinDetailViewModel: ObservableObject {
    var coin: Coin

    init(coin: Coin) {
        self.coin = coin
    }
}
