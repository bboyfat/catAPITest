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
    
    func present(_ model: [CatModel]?) {
        self.viewModel = CatsViewModel(model)
        controller.refresh()
    }
    
    
    func didSelectCat(_ withIndex: Int) {
        let cat = self.viewModel?.getCat(with: withIndex)
        self.controller.didSelect(cat)
    }
    
    init(_ controller: CatsController?) {
        self.controller = controller
        super.init()
        controller?.setDataSource(self)
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

