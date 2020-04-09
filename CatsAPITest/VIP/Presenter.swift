//
//  Presenter.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol Presenter {
    
    var controller: CatsController! { get set }
    var viewModel: CatsViewModel? { get set }
    var didSelectCat: (CatsResponse?) -> () { get set }
    func present(_ model: [CatModel]?)
    
}
