//
//  Globals.swift
//  Trails
//
//  Created by Rijo Samuel on 13/04/21.
//

import Foundation
import CryptoKit
import SwiftUI

// Singleton Globals class
final class Globals {
    
    static let shared = Globals()
    
    private init() {
        //  initializer made private to prevent multiple instances on singleton class
    }
    
    static let APP_NAME = "Trials"
    static let API_PATH = "iMuthoot.ashx/ProcessRequest"
    static let SYSTEM_VERSION = UIDevice.current.systemVersion
    static let SYSTEM_OS = UIDevice.current.systemName
    static let APP_VERSION = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    static var BASE_URL: URL {
        let urlString = Environment.QC_EXTERNAL_URL + API_PATH
        let url = URL(string: urlString)
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    var sessionToken: String {
        get {
            return UserDefaults.standard.value(forKey: "sessionToken") as! String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "sessionToken")
        }
    }
    
    var APP_TOKEN: String {
        let milliSeconds = String(timeInMilliseconds)
        let newToken = "rijoemsyne@123" + milliSeconds
        let inputData = Data(newToken.utf8)
        let hashed = SHA256.hash(data: inputData)
        let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
    
    private var timeInMilliseconds: Int {
        let date = Date()
        let interval = date.timeIntervalSince1970
        let intervalInt = Int(interval)
        return intervalInt
    }
    
    struct Environment {
        
        fileprivate static let DEV_URL =  "http://10.50.5.78:11101/"    /*DEV*/
        fileprivate static let DEV_EXTERNAL_URL = "http://59.145.109.138:11101/"    /*External Dev*/
        fileprivate static let UAT_EXTERNAL_URL = "http://59.145.109.137:11101/"    /*UAT External*/
        fileprivate static let QC_EXTERNAL_URL = "http://59.145.109.141:11101/"    /*ExternalQc*/
        fileprivate static let LIVE_EXTERNAL_URL = "https://imuthoot.muthootfinance.com/"   /*Live/production*/
    }
    
    struct EndPoint {
        
        static let LOGIN = "login"
        static let RESEND_LOGIN_OTP = "resend_login_otp"
        static let OFFERS = "offers_rates_and_update"
        static let PRODUCTS = "products"
    }
    
    struct Color {
        
        static let primary = SwiftUI.Color("PrimaryColor")
    }
}
