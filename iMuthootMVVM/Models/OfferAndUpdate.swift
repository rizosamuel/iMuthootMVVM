//
//  OffersAndUpdates.swift
//  Trails
//
//  Created by Rijo Samuel on 13/04/21.
//

import Foundation

// MARK: - DataClass
struct OfferAndUpdate: Codable {
    
    let appVersionUpdate: String
    let offers: [Offer]
    let rate: Int
    
    enum CodingKeys: String, CodingKey {
        case appVersionUpdate = "app_version_update"
        case offers, rate
    }
}

struct Offer: Codable, Identifiable {

    let id: Int
    let title: String
    let image: String?
    let r, resultCount: Int

    enum CodingKeys: CodingKey {

        case id, r, title, image, resultCount

        var stringValue: String {
            switch self {
                case .id, .r: return "r"
                case .title: return "title"
                case .image: return "image"
                case .resultCount: return "result_count"
            }
        }
    }
}
