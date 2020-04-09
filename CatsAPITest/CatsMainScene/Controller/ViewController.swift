//
//  ViewController.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol CatsController: class {
    
    func didSelect(_ cat: CatsResponse?)
    func setDataSource(_ dataSource: UITableViewDataSource)
    func refresh()
}

class ViewController: UIViewController, CatsController {
  
    @IBOutlet var tableView: UITableView!
    
    private var interactor: Interactor!
    private var router: Router!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        registerCell()
        interactor.fetchData()
    }
    
    private func commonInit() {
        interactor = CatsInteractor()
        tableView.delegate = interactor
        let presenter = CatsPresenter(self)
        interactor.presenter = presenter
    }
    
    func setDataSource(_ dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func didSelect(_ cat: CatsResponse?) {
         self.router = MainRouter(cat, self.navigationController)
         self.router.routeToDetails()
     }
    
    func refresh() {
        tableView.reloadRows()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CatCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CatCellID")
    }
     
}
