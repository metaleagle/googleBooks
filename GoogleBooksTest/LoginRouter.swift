//
//  LoginRouter.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    class func loginModule() -> UIViewController{
        if let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? LoginView{
            let presenter = LoginPresenter()
            presenter.view = view
            view.presenter = presenter
            presenter.router = LoginRouter()
            
            let interactor = LoginInteractor()
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.fbAuthorizer = FBAuthorizer(withInteractor: interactor, loginView: view)
            interactor.gpAuthorizer = GPAuthorizer(withInteractor: interactor, loginView: view)
            
            return view
        }
        
        return UIViewController()
    }
    
    func didLogin(with userInfo:UserInfoProtocol, inView view: LoginViewProtocol){
        let profileView = UserProfileRouter.userProfileModule(for: userInfo)
        profileView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named:"profile"), selectedImage: nil)
        let searchView = SearchVolumesRouter.listVolumesModule()
        searchView.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named:"search"), selectedImage: nil)
        let cartView = CartVolumesRouter.listVolumesModule()
        cartView.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named:"cart"), selectedImage: nil)
        let mainView = UITabBarController()
        mainView.viewControllers = [profileView, searchView, cartView]
        (view as? UIViewController)?.present(mainView, animated: true, completion: nil)
    }
}
