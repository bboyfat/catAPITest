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
    func refresh(_ viewModel: CatsViewModel?)
}

class ViewController: UIViewController, CatsController {
  
    @IBOutlet var tableView: UITableView!
    
    private var interactor: Interactor!
    private var router: Router!
    private var tableViewDataSourceManager = TableViewDataSourceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        registerCell()
        interactor.fetchData()
        setDSD()
    }
    
    private func commonInit() {
        interactor = CatsInteractor()
        let presenter = CatsPresenter()
        presenter.controller = self
        interactor.presenter = presenter
    }
    
    
    func didSelect(_ cat: CatsResponse?) {
         self.router = MainRouter(cat, self.navigationController)
         self.router.routeToDetails()
     }
    
    func refresh(_ viewModel: CatsViewModel?) {
        tableViewDataSourceManager.viewModel = viewModel
        tableView.reloadRows()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CatCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CatCellID")
    }
    
    private func setDSD() {
        tableView.dataSource = tableViewDataSourceManager
        tableView.delegate = self
    }
     
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.didSelectCat(indexPath.row)
    }
}


