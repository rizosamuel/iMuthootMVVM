//
//  OffersResource.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

struct OffersResource: APIResource {
    
    typealias DataType = String
    typealias ModelType = OfferAndUpdate
    
    var methodName: String {
        return Globals.EndPoint.OFFERS
    }
    
    var meta: InputMeta {
        
        let meta = InputMeta(appToken: "", appVersion: "2.7.1", customerid: "0", os: Globals.SYSTEM_OS, osVersion: Globals.SYSTEM_VERSION, uuid: "1", projectID: "0", channelId: "")
        
        return meta
    }
    
    var data: String {
        return ""
    }
    
    func execute(completion: @escaping (APIResponse<OfferAndUpdate>, String?) -> Void) {
        load(urlRequest: urlRequest, withCompletion: completion)
    }
}
