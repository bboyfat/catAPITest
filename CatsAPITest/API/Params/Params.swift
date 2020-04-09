//
//  Headers.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation


enum Header {
    
    var headers: [String: String] {
        switch  self {
        case .commonHeaders:
            return ["x-api-key": "c9edccf8-cf0c-44f1-816f-30793682d200" ]
        }
        
    }
    
    case commonHeaders
}

enum HTTPMethods: String {
    case get = "Get"
}


enum APIPaths {
    static var limit: Int = 10
    static var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1/images/search?limit=\(APIPaths.limit)&page=1&order=Desc")!
    }
}
