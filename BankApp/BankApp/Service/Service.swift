//
//  Service.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit
import Foundation

class Service<T: Codable> {
    typealias Completion = ((T) -> Void)
    typealias Failure = ((String) -> Void)
    
    private var url: URL
    
    init(url: String) {
        self.url = URL(string: url)!
    }
    
    func get(completion: @escaping Completion, failure: @escaping Failure) {
        var urlRequest = URLRequest(url: self.url)
        
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if error == nil {
                do {
                    guard let data = data else {
                        return
                    }
                    
                    let json = try JSONDecoder().decode(T.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch {
                    DispatchQueue.main.async {
                        failure(error.localizedDescription)
                    }
                }
            } else {
                failure("error: \(String(describing: error))")
            }
        }).resume()
    }
    
    func post(params: [String: Any], completion: @escaping Completion, failure: @escaping Failure) {
        var urlRequest = URLRequest(url: self.url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        urlRequest.allHTTPHeaderFields = ["Content-Type" : "application/json"]
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if error == nil {
                do {
                    guard let data = data else {
                        return
                    }
                    
                    let json = try JSONDecoder().decode(T.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(json)
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        failure(error.localizedDescription)
                    }
                }
            } else {
                failure("error: \(String(describing: error))")
            }
        }).resume()
    }
}
