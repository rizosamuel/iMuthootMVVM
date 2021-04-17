//
//  Login.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

struct Login: Codable {
    
    let uuid, mobileNumber: String
    let otpStatus: Bool

    enum CodingKeys: String, CodingKey {
        case uuid
        case mobileNumber = "mobile_number"
        case otpStatus = "otp_status"
    }
}
