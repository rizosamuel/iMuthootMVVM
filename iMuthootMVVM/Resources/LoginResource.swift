//
//  LoginResource.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

struct LoginResource: APIResource {
    
    typealias DataType = LoginData
    typealias ModelType = Login
    
    var methodName: String {
        return Globals.EndPoint.LOGIN
    }
    
    var meta: InputMeta {
        
        let meta = InputMeta(appToken: "", appVersion: "2.7.1", customerid: "0", os: Globals.SYSTEM_OS, osVersion: Globals.SYSTEM_VERSION, uuid: "1", projectID: "0", channelId: "")
        
        return meta
    }
    
    var data: LoginData {
        
        let data = LoginData(appToken: Globals.shared.APP_TOKEN, isRooted: false, latitude: "", longitude: "", password: "emsyne@123", pushToken: "", username: "benedict")
        
        return data
    }
    
    func execute(completion: @escaping (APIResponse<Login>, String?) -> Void) {
        load(urlRequest: urlRequest, withCompletion: completion)
    }
}

struct LoginData: Codable {
    
    let appToken: String
    let isRooted: Bool
    let latitude, longitude, password, pushToken: String
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case appToken = "app_token"
        case isRooted, latitude, longitude, password
        case pushToken = "push_token"
        case username
    }
}
