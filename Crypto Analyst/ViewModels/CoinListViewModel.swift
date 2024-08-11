//
//  CoinListViewModel.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import Foundation

class CoinListViewModel: ObservableObject {
    @Published var coins: [Coin] = []

    private var service = CoinService()

    func fetchCoins() {
        service.getCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
}
