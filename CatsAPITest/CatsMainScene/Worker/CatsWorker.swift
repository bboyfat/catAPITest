//
//  CatsWorker.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

class CatsWorker: Worker {
    
    private var useCase: UseCaseProtocol!
    private var params: Requestable!
    private var client: APIClientProtocol!
    
    func fetchData(_ completion: @escaping([CatModel]?) -> ()) {
        useCase.execute { (model, error) in
            completion(model as? [CatModel])
        }
    }
    
    private func commonInit() {
        params = CatRequestParams()
        client = APIClient(params)
        useCase = CatsUseCase<[CatsResponse]>(client: client)
    }
    
    init() {
        commonInit()
    }
    
}
