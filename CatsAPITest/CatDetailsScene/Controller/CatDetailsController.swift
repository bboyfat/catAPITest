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


class CatDetailsInteractor {
    var presenter: CatsPresenter!
    var worker = CatsWorker()
    func fetchData() {
        worker.fetchData { [weak self] (model) in
            self?.presenter.present(model)
        }
    }
    
}

class CatViewModel {
    
}

class CatDetailsPresenter: NSObject {
    
    var controller: CatsController!
    var viewModel: CatViewModel?
    
    func present(_ model: CatModel?) {
       
    }
    
    
    init(_ controller: CatsController) {
        self.controller = controller
        super.init()
    }
}


class CatDetailsWorker {
    
    private var useCase: UseCaseProtocol!
    private var params: Requestable!
    private var client: APIClientProtocol!
    
    func fetchData(_ completion: @escaping(CatModel?) -> ()) {
        useCase.execute { (model, error) in
            completion(model as? CatModel)
        }
    }
    
    
    private func commonInit() {
        params = CatRequestParams()
        client = APIClient(params)
        useCase = CatsUseCase<[CatsResponse]>(client: client)
    }

    init() {
        commonInit()
    }
}


extension Encodable {
    func prettyPrintedObj() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(self)
        return String("\(try? JSONSerialization.jsonObject(with: data, options: []))")
    }
}
