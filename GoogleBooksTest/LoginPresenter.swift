//
//  LoginPresenter.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    //VIEW >> PRESENTER methods
    func fbLoginRequested(){
        self.view?.showLoading(true)
        self.interactor?.fbLoginRequested()
    }
    func gpLoginRequested(){
        self.view?.showLoading(true)
        self.interactor?.gpLoginRequested()
    }
    
    //PRESENTER<<INTERACTOR methods
    func loggedIn(withUserInfo userInfo: UserInfoProtocol) {
        self.view?.showLoading(false)
        self.router?.didLogin(with:userInfo, inView: self.view!)
    }
    func failedToLoginWithError(_ error: String){
        self.view?.showLoading(false)
        self.view?.displayErrorWithMessage(error)
    }
    
    func loginCanceled(with authorizer:AuthorizerProtocol){
        self.view?.showLoading(false)
    }
}
