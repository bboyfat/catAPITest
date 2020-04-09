//
//  UseCase.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol UseCaseProtocol {
    
    func execute (handler: @escaping (Codable?, Error?) -> ())
    
}

class CatsUseCase<Response: Codable>: UseCaseProtocol {
    
    private let client: APIClientProtocol
    
    func execute(handler: @escaping (Codable?, Error?) -> ()) {
        client.request { [weak self] (data, error) in
            switch data{
            case nil:
                handler(nil, error)
            default:
                self?.decodeData(data: data, handler: { (model, err) in
                    OperationQueue.main.addOperation {
                        handler(model, err)
                    }
                })
                
            }
        }
    }
    
    private func decodeData(data: Data?, handler: @escaping (Response?, Error? ) -> ())  {
        var object: Response?
        do{
            object = try JSONDecoder().decode(Response.self, from: data!)
            handler(object, nil)
        } catch let decErr{
            print(decErr)
            object = nil
            handler(nil, decErr)
        }
    }
    
    init(client: APIClientProtocol) {
        self.client = client
    }
    
}
