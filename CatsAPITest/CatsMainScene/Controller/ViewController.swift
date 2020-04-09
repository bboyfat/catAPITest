//
//  ViewController.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol CatsController: class {
    
    var tableView: UITableView! { get set }
    
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var interactor: CatsInteractor!
    private var presenter: CatsPresenter!
    private var router: Router!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        interactor.fetchData()
        didSelect()
    }
    
    private func commonInit() {
        interactor = CatsInteractor()
        presenter = CatsPresenter(self)
        interactor.presenter = presenter
    }
    
    private func didSelect() {
        self.presenter.didSelectCat = { [weak self] (cat) in
            self?.router = MainRouter(cat, self?.navigationController)
            self?.router.routeToDetails()
        }
    }
    
}

extension ViewController: CatsController {
    
}






