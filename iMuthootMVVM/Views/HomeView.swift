//
//  ContentView.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.offers) { offer in
                VStack {
                    Text(offer.title)
                }
            }
        }
        .onAppear {
            viewModel.fetchOffers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
