//
//  VolumeDetailsRouter.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class VolumeDetailsRouter: VolumeDetailsRouterProtocol{
    class func volumeDetailsModule(with volumeItem: VolumeItemUIProtocol) -> UIViewController{
        guard let navigationController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "volumeDetailsNavigation") as? UINavigationController,
            let view = navigationController.viewControllers.first as? VolumeDetailsViewController else {
                return UIViewController()
        }
        let presenter = VolumeDetailsPresenter()
        view.presenter = presenter
        presenter.view = view
        let interactor = VolumeDetailsInteractor(volumeItem)
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = VolumeDetailsRouter()
        return navigationController

    }
    
    func dismissVolumeDetailsInterface(from view:VolumeDetailsViewProtocol, completion: (() -> Void)?){
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: nil)
        }
    }
}
