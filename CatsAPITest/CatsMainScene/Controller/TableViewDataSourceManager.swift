//
//  TableViewDataSourceManager.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol DataSourceManager {
    
    var viewModel: CatsViewModel? { get set }
    var tableView: UITableView! { get set }
    func reload(_ viewModel: CatsViewModel?)
    
}

class TableViewDataSourceManager: NSObject, DataSourceManager {
    
    var viewModel: CatsViewModel?
    var tableView: UITableView!
    
    private func registerCell() {
        let nib = UINib(nibName: "CatCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CatCellID")
    }
    
    func reload(_ viewModel: CatsViewModel?) {
        self.viewModel = viewModel
        tableView.reloadRows()
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.registerCell()
        
    }
}

extension TableViewDataSourceManager: UITableViewDataSource {
    
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
