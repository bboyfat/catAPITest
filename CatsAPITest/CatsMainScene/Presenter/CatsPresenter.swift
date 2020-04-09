//
//  CatsPresenter.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

class CatsPresenter: NSObject, Presenter {
    
    weak var controller: CatsController!
    var viewModel: CatsViewModel?
    
    func present(_ model: [CatModel]?) {
        self.viewModel = CatsViewModel(model)
        controller.refresh(viewModel)
    }
    
    func didSelectCat(_ withIndex: Int) {
        let cat = self.viewModel?.getCat(with: withIndex)
        self.controller.didSelect(cat)
    }
    
}
