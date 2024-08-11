//
//  CoinRowView.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: coin.icon_url)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 40, height: 40)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(coin.coin_name)
                    .font(.headline)
                Text("\(coin.current_price, specifier: "%.2f") USDT")
                    .font(.subheadline)
            }
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: Coin(coin_name: "BTCUSDT.P", current_price: 58744.5, icon_url: "https://assets.coingecko.com/coins/images/1/standard/bitcoin.png", recommendation: "SELL"))
    }
}
