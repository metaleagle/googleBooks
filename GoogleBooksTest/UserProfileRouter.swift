//
//  UserProfileRouter.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class UserProfileRouter: UserProfileRouterProtocol{
    class func userProfileModule(for userInfo: UserInfoProtocol) -> UIViewController{
        if let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileView") as? UserProfileView{
            let presenter = UserProfilePresenter()
            let interactor = UserProfileInteractor(with: userInfo)
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            interactor.presenter = presenter
            presenter.router = UserProfileRouter()
            return UINavigationController(rootViewController: view)
        }
        return UIViewController()
    }
}
