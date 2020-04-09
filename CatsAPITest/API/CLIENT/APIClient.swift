//
//  APIClient.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit 

protocol APIClientProtocol: class {
    func request(_ completion: @escaping (Data?, Error?) -> ())
}

class APIClient: APIClientProtocol {
    
    private var params: Requestable
    private var queue = DispatchQueue(label: "backFetching", qos: .utility, attributes: .concurrent, target: .global())
    
    func request(_ completion: @escaping (Data?, Error?) -> ()) {
        var request = URLRequest(url: params.path)
        request.allHTTPHeaderFields = params.headers
        request.httpMethod = params.method
        request.cachePolicy = .returnCacheDataElseLoad
        let session = URLSession.shared
        queue.async {
            session.dataTask(with: request) { (data, urlResponse, error) in
                guard let data = data else { return }
                print(try! JSONSerialization.jsonObject(with: data, options: []))
                completion(data, error)
            }.resume()
        }
        
    }
    
    init(_ params: Requestable) {
        self.params = params
    }
    
}
