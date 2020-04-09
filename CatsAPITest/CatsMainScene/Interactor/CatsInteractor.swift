//
//  CatsInteractor.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CatsInteractor: NSObject, Interactor {
    
    var presenter: Presenter!
    var worker: Worker!
    
    func fetchData() {
        worker.fetchData { [weak self] (model) in
            self?.presenter.present(model)
        }
    }

    override init() {
        super.init()
        worker = CatsWorker()
    }
}

extension CatsInteractor: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectCat(indexPath.row)
    }
    
}
