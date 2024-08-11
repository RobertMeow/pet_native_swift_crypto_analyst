//
//  CoinService.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import Foundation

class CoinService {
    func getCoins(completion: @escaping ([Coin]) -> Void) {
        guard let url = URL(string: "http://64.176.68.49:5101/getCoins") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let coins = try? JSONDecoder().decode([Coin].self, from: data)
                completion(coins ?? [])
            }
        }.resume()
    }
}
