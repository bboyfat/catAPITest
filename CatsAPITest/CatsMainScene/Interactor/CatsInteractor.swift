//
//  CatsInteractor.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

class CatsInteractor: Interactor {
    
    var presenter: Presenter!
    var worker: Worker!
    
    func fetchData() {
        worker.fetchData { [weak self] (model) in
            self?.presenter.present(model)
        }
    }

    init() {
        worker = CatsWorker()
    }
}
