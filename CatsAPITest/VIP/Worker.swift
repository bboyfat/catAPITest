//
//  Worker.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol Worker {
    
    func fetchData(_ completion: @escaping([CatModel]?) -> ())
    
}
