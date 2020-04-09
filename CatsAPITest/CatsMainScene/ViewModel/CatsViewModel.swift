//
//  CatsViewModel.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CatsViewModel {
    
    private var model: [CatsResponse] = []
    private let imageLoader: ImageLoader = CatImageLoader()
    
    func numberOfRows() -> Int {
        return model.count
    }
    
    func getCat(with index: Int) -> CatsResponse {
        return model[index]
    }
    
    func getImage(with index: Int, for imageView: UIImageView){
        guard let url = URL(string: getCat(with: index).url) else { return }
        imageLoader.getImage(url) { (image) in
            imageView.image = image
        }
    }
    
    func getSizeText(with index: Int) -> String {
        return "Height: \(self.getCat(with: index).height), Width: \(self.getCat(with: index).width)"
    }
    
    init(_ model: [CatModel]?) {
        guard let model = model as? [CatsResponse] else {
            return
        }
        self.model = model
    }
}
