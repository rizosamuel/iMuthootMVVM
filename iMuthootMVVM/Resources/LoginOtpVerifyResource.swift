//
//  LoginOtpVerify.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

struct LoginOtpVerifyResource: APIResource {
    
    typealias DataType = OTPVerifyData
    typealias ModelType = Login
    
    var methodName: String {
        return Globals.EndPoint.LOGIN
    }
    
    var meta: InputMeta {
        
        let meta = InputMeta(appToken: "", appVersion: "2.7.1", customerid: "0", os: Globals.SYSTEM_OS, osVersion: Globals.SYSTEM_VERSION, uuid: "1", projectID: "0", channelId: "")
        
        return meta
    }
    
    var data: OTPVerifyData {
        
        let data = OTPVerifyData(isRooted: false, latitude: "", longitude: "", otp: "1234", username: "benedict", uuid: "105")
        
        return data
    }
    
    func execute(completion: @escaping (APIResponse<Login>, String?) -> Void) {
        load(urlRequest: urlRequest, withCompletion: completion)
    }
}

// MARK: - Login Otp Verify Model
struct OTPVerifyData: Codable {
    
    let isRooted: Bool
    let latitude, longitude, otp, username: String
    let uuid: String
}
