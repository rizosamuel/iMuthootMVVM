//
//  LoginOtpVerify.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

// MARK: - DataClass
struct LoginOtpVerify: Codable {
    
    let id: Int
    let username, createdAt, updatedAt, email: String
    let mobileNumber, referralCode, firstName, lastName: String
    let facebookID, unitCode, muthootID, loginType: String
    let pushToken, blocked, deviceType, kycStatus: String
    let referrerID, appToken: String
    let topupMinvalue: Int
    let scores: Scores
    let locations: [Location]
    let profile: Profile
    let token, uuid: String

    enum CodingKeys: String, CodingKey {
        case id, username
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case email
        case mobileNumber = "mobile_number"
        case referralCode = "referral_code"
        case firstName = "first_name"
        case lastName = "last_name"
        case facebookID = "facebook_id"
        case unitCode = "unit_code"
        case muthootID = "muthoot_id"
        case loginType = "login_type"
        case pushToken = "push_token"
        case blocked
        case deviceType = "device_type"
        case kycStatus = "kyc_status"
        case referrerID = "referrer_id"
        case appToken = "app_token"
        case topupMinvalue = "topup_minvalue"
        case scores, locations, profile, token, uuid
    }
}

// MARK: - Location
struct Location: Codable {
    
    let branchID, branchName, branchCode, pincode: String
    let ph1, ph2, mobile, latitude: String
    let longitude, state, city, region: String
    let country, landmark, address, email: String
    let locationType, searchVector: String

    enum CodingKeys: String, CodingKey {
        case branchID = "branch_id"
        case branchName = "branch_name"
        case branchCode = "branch_code"
        case pincode, ph1, ph2, mobile, latitude, longitude, state, city, region, country, landmark, address, email
        case locationType = "location_type"
        case searchVector = "search_vector"
    }
}

// MARK: - Profile
struct Profile: Codable {
    
    let firstName, middleName, lastName, mobile2: String
    let email, kycStatus, customerid, address: String
    let city, landMark, pinCode, aadharNo: String
    let isUnlockerCustomer: Bool
    let crmCustCode, panNo, isPanVerified, isPanUpdateAllowed: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case mobile2, email
        case kycStatus = "kyc_status"
        case customerid, address, city
        case landMark = "land_mark"
        case pinCode = "pin_code"
        case aadharNo = "aadhar_no"
        case isUnlockerCustomer = "is_unlocker_customer"
        case crmCustCode = "crm_cust_code"
        case panNo = "pan_no"
        case isPanVerified = "is_pan_verified"
        case isPanUpdateAllowed = "is_pan_update_allowed"
    }
}

// MARK: - Scores
struct Scores: Codable {
    
    let crispScore, loyaltyPoints, activeLoanCount: String
    let referralPoint: Int

    enum CodingKeys: String, CodingKey {
        case crispScore = "crisp_score"
        case loyaltyPoints = "loyalty_points"
        case activeLoanCount = "active_loan_count"
        case referralPoint = "referral_point"
    }
}
