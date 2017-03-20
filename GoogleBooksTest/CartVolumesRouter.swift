//
//  CartVolumesRouter.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit
class CartVolumesRouter: VolumesListRouterProtocol{
    class func listVolumesModule() -> UIViewController{
        let view = VolumesListViewController(style: .plain)
        let presenter = VolumesListPresenter()
        let interactor = VolumesListInteractor()
        let dataStorage = CartVolumesDataStorage()
        interactor.requestAPI = GoogleBooksAPI()
        interactor.dataStorage = dataStorage
        dataStorage.interactor = interactor
        view.presenter = presenter
        presenter.view = view
        presenter.router = SearchVolumesRouter()
        presenter.interactor = interactor
        interactor.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    func showVolumeDetailsModule(for volume: VolumeItemUIProtocol, fromView: UIViewController) {
        let detailsView = VolumeDetailsRouter.volumeDetailsModule(with: volume)
        fromView.present(detailsView, animated: true, completion: nil)
    }
}
