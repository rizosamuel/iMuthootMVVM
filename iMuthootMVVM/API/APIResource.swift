//
//  APIResource.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation

protocol APIResource {
    
    associatedtype DataType: Codable
    associatedtype ModelType: Codable
    
    var methodName: String { get }
    var meta: InputMeta { get }
    var data: DataType { get }
    
    func execute(completion: @escaping (APIResponse<ModelType>, String?) -> Void)
}

// MARK: - Default implementation of request object
extension APIResource {
    
    var urlRequest: URLRequest {
        
        var request = URLRequest(url: Globals.BASE_URL)
        request.httpMethod = "POST"
        request.setValue(methodName, forHTTPHeaderField: "MethodName")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestData = APIRequest<DataType>(data: data, meta: meta)
        
        do {
            request.httpBody = try JSONEncoder().encode(requestData)
        } catch let error {
            print(error.localizedDescription)
        }
        
        return request
    }
}

// MARK: - Default implementation of HTTP API call
extension APIResource {
    
    func load(urlRequest: URLRequest, withCompletion completion: @escaping (_ response: APIResponse<ModelType>, _ error: String?) -> Void) {
        
        Utils.shared.printRequestBody(request: urlRequest)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                print("Error fetching data from server\nERROR: \(String(describing: error))")
                return
            }
            
            guard let jsonData = data else {
                print("Response Data is empty")
                return
            }
            
            Utils.shared.printResponseBody(response: data)
            
            let decoder = JSONDecoder()
            let response = try? decoder.decode(APIResponse<ModelType>.self, from: jsonData)
            
            guard let decodedResponse = response else {
                print("Unable to parse data from response")
                return
            }
            
            guard decodedResponse.responseCode == 0 else {
                DispatchQueue.main.async { completion(decodedResponse, decodedResponse.message!) }
                return
            }
            
            DispatchQueue.main.async { completion(decodedResponse, nil) }
        }
        
        task.resume()
    }
}
