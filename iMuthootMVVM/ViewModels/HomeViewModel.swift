//
//  HomeViewModel.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var isLoading = false
    
    @Published private(set) var offers: [Offer] = []
    
    func fetchOffers() {
        
        let resource = OffersResource()
        
        guard !isLoading else { return }
        isLoading = true
        
        resource.execute { [weak self] (response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            self?.offers = response.data!.offers
            self?.isLoading = false
        }
    }
}
