//
//  UserProfilePresenter.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class UserProfilePresenter: UserProfilePresenterProtocol{
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol? 
    weak var view: UserProfileViewProtocol?
    func viewDidLoad() {
        if let userInfo = self.interactor?.getUserProfile(){
            self.view?.setUserName(userInfo.fullUserName)
            if let url = userInfo.userpicURL{
                self.view?.setUserImage(with: url)
            }
        }
    }
    
    func userInfoUpdated() {
        self.viewDidLoad()
    }
}
