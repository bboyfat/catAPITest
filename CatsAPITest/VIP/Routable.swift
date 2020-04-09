//
//  Routable.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol Routable: UIViewController {
    
    var data: CatsResponse? {get set }
    
}
