//
//  SearchVolumesRouter.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit
class SearchVolumesRouter: VolumesListRouterProtocol{
    class func listVolumesModule() -> UIViewController{
        let view = SearchVolumesListViewController(style: .plain)
        let presenter = SearchVolumesListPresenter()
        let interactor = SearchVolumesListInteractor()
        let dataStorage = VolumesSearchDataStorage()
        interactor.searchFields = ["Title":"intitle", "Author":"inauthor"]
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
