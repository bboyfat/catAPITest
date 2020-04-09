//
//  CatsPresenter.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CatsPresenter: NSObject, Presenter {
    
    weak var controller: CatsController!
    var viewModel: CatsViewModel?
    var didSelectCat: (CatsResponse?) -> () = {_ in }
    
    func present(_ model: [CatModel]?) {
        self.viewModel = CatsViewModel(model)
        self.controller.tableView.reloadRows()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CatCell", bundle: nil)
        controller.tableView.register(nib, forCellReuseIdentifier: "CatCellID")
    }
    
    init(_ controller: CatsController) {
        self.controller = controller
        super.init()
        registerCell()
        controller.tableView.dataSource = self
        controller.tableView.delegate = self
    }
    
}

extension CatsPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatCellID", for: indexPath) as? CatCell,
              let viewModel = viewModel
              else { return UITableViewCell() }
        
        cell.sizeLbl.text = viewModel.getSizeText(with: indexPath.row)
        viewModel.getImage(with: indexPath.row, for: cell.catImageView)
        return cell
    }
    
}

extension CatsPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = self.viewModel?.getCat(with: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
        self.didSelectCat(cat)
    }
    
}
