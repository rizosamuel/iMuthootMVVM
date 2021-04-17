//
//  APIRequest.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

// MARK: - API Request Model
struct APIRequest<D: Encodable>: Encodable {
    
    let data: D?
    let meta: InputMeta
}

// MARK: - Input Meta Model
struct InputMeta: Encodable {
    
    let appToken, appVersion, customerid, os: String
    let osVersion, uuid: String
    var projectID: String?
    var channelId: String?

    enum CodingKeys: String, CodingKey {
        case appToken = "app_token"
        case appVersion = "app_version"
        case customerid, os, channelId
        case osVersion = "os_version"
        case projectID = "project_id"
        case uuid
    }
}
