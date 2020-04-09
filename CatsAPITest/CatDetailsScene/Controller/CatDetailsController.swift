//
//  CatDetailsController.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CatDetailsController: UIViewController, Routable {
    
    var data: CatsResponse?
    private var imageLoader: ImageLoader = CatImageLoader()
    
    @IBOutlet var detailsView: CatDetailsView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViews()
    }
    
    
    private func setViews() {
        guard let url = URL(string: data?.url ?? "") else {
            return
        }
        imageLoader.getImage(url) { [weak self] (image) in
            self?.detailsView.catImageView.image = image
        }
        detailsView.descriptionLbl.text = data.prettyPrintedObj() ?? ""
    }

}

