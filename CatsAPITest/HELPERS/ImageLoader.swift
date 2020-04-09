//
//  ImageLoader.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 09.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol ImageLoader {
    func getImage(_ path: URL, _ completion: @escaping(UIImage?) -> ())
}

class CatImageLoader: ImageLoader {
    
    func getImage(_ path: URL, _ completion: @escaping(UIImage?) -> ()) {
        DispatchQueue.global().async {
            let request = URLRequest(url: path, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                let image = UIImage(data: data ?? Data())
                DispatchQueue.main.async {
                    completion(image)
                }
            }.resume()
        }
    }
    
}
