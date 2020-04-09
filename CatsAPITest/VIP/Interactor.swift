//
//  Interactor.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol Interactor: UITableViewDelegate {
    
    var presenter: Presenter! { get set }
    var worker: Worker! { get set }
    func fetchData()
    
}

