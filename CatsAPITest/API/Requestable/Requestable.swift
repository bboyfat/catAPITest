//
//  Requestable.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol Requestable {
    
    var path: URL { get }
    var headers: [String: String] { get }
    var method: HTTPMethods.RawValue { get }
    
}

struct CatRequestParams: Requestable {
    
    var path: URL {
        return APIPaths.baseURL
    }
    
    var headers: [String : String] {
        return Header.commonHeaders.headers
    }
    
    var method: HTTPMethods.RawValue {
        return HTTPMethods.get.rawValue
    }
    
}
