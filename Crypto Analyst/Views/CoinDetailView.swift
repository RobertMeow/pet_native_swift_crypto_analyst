//
//  CoinDetailView.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import SwiftUI

struct CoinDetailView: View {
    @ObservedObject var viewModel: CoinDetailViewModel

    var body: some View {
        List {
            informationSection
            placeholderSection
        }
        .navigationTitle(viewModel.coin.coin_name)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 8) {
                    coinIcon
                    Text(viewModel.coin.coin_name)
                    .font(.headline)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var informationSection: some View {
        Section(header: Text("Information").font(.headline)) {
            informationRow(title: "Current Price", value: formattedPrice(viewModel.coin.current_price), valueColor: .gray)
            informationRow(title: "Recommendation", value: viewModel.coin.recommendation, valueColor: viewModel.coin.recommendation == "BUY" ? .green : .red)
        }
    }
    
    private var placeholderSection: some View {
        Text("There will be more information here someday...")
            .foregroundColor(.blue)
            .font(.headline)
            .fontWeight(.bold)
    }
    
    private var coinIcon: some View {
        AsyncImage(url: URL(string: viewModel.coin.icon_url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
        } placeholder: {
            ProgressView()
        }
    }
    
    private func informationRow(title: String, value: String, valueColor: Color) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundColor(valueColor)
        }
    }
    
    private func formattedPrice(_ price: Double) -> String {
        return String(format: "%.2f USDT", price)
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(viewModel: CoinDetailViewModel(coin: Coin(
            coin_name: "BTCUSDT.P",
            current_price: 58744.5,
            icon_url: "https://assets.coingecko.com/coins/images/1/standard/bitcoin.png",
            recommendation: "SELL"
        )))
    }
}
