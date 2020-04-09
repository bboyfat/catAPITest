//
//  CatsReponse.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol CatModel: Codable {
    
}

struct CatsResponse: CatModel {
    var id: String
    var url: String
    var width: Int
    var height: Int
}
