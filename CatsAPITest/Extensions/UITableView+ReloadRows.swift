//
//  UITableView+ReloadRows.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

extension UITableView {
    func reloadRows() {
        UIView.animate(withDuration: 0.4, animations: {
            self.transform = CGAffineTransform(translationX: 100, y: 0)
            self.alpha = 0.2
        }) { (_) in
            UIView.animate(
                withDuration: 0.4,
                delay:  0.05,
                usingSpringWithDamping: 0.25,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    self.alpha = 1
                    self.reloadData()
                    self.transform = .identity
            })
        }
    }
}
