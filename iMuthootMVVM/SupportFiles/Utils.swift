//
//  Utils.swift
//  Trails
//
//  Created by Rijo Samuel on 12/04/21.
//

import Foundation
import Network
import SwiftUI

//MARK: - Singleton Utils class
final class Utils {
    
    static let shared = Utils()
    
    private init() { }
    
    // To print HTTP Request body
    func printRequestBody(request: URLRequest) {
        
        guard let request = request.httpBody?.prettyPrintedJSONString else {
            print("Nil Request")
            return
        }
        
        print("REQUEST: \(request)")
    }
    
    // To print HTTP Response body
    func printResponseBody(response: Data?) {
        
        guard let response = response?.prettyPrintedJSONString else {
            print("Nil Response")
            return
        }
        
        print("RESPONSE: \(response)")
    }
}

// MARK: - Extending Data class for pretty printing JSON Object for console logging
extension Data {
    
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
