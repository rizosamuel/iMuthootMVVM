//
//  Offer.swift
//  Trails
//
//  Created by Rijo Samuel on 12/04/21.
//

import Foundation

// MARK: - API Response Model
struct APIResponse<T: Decodable>: Decodable {
    
    let responseCode: Int
    let data: T?
    let meta: Meta?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case data, meta, message
    }
}

// MARK: - Response Meta Model
struct Meta: Decodable {
    
    let apiVersion: Int
    
    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
    }
}
