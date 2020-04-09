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
    func didSelect(_ cat: CatsResponse?)
}

class ViewController: UIViewController, CatsController {
  
    @IBOutlet var tableView: UITableView!
    
    private var interactor: Interactor!
    private var router: Router!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        interactor.fetchData()
    }
    
    private func commonInit() {
        interactor = CatsInteractor()
        let presenter = CatsPresenter(self)
        interactor.presenter = presenter
    }
    
    
    func didSelect(_ cat: CatsResponse?) {
         self.router = MainRouter(cat, self.navigationController)
         self.router.routeToDetails()
     }
     
}
