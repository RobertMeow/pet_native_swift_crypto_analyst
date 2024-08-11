//
//  CoinListView.swift
//  Crypto Analyst
//
//  Created by Rodeberht on 8/12/24.
//

import SwiftUI

struct CoinListView: View {
    @StateObject var viewModel = CoinListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.coins) { coin in
                NavigationLink(destination: CoinDetailView(viewModel: CoinDetailViewModel(coin: coin))) {
                    CoinRowView(coin: coin)
                }
            }
            .navigationTitle("Crypto Coins List")
            .onAppear {
                viewModel.fetchCoins()
            }
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
