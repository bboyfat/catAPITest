//
//  Router.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainRouter: Router {
    
    var navigation: UINavigationController?
    var data: CatsResponse?
    
    func routeToDetails() {
        guard let controller = UIStoryboard(name: "CatDetails", bundle: nil).instantiateViewController(withIdentifier: "CatDetailsControllerID") as? Routable
        else { return }
        passDataToDetails(controller)
        navigation?.pushViewController(controller, animated: true)
    }
    
    private func passDataToDetails(_ controller: Routable){
        controller.data = data
    }
    
    init(_ data: CatsResponse?, _ navigationController: UINavigationController?) {
        self.data = data
        self.navigation = navigationController
    }
    
}
