//
//  CatsInteractor.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

class CatsInteractor: Interactor {
    
    var didSelectCat: (CatsResponse?) -> () = {_ in}
    var presenter: Presenter!
    var worker: Worker!
    
    func fetchData() {
        didSelect()
        worker.fetchData { [weak self] (model) in
            self?.presenter.present(model)
        }
    }
    
    private func didSelect() {
        self.presenter.didSelectCat = {[weak self] (cat) in
            self?.didSelectCat(cat)
        }
    }
    
    init() {
        worker = CatsWorker()
    }
}
