//
//  LoginInteractor.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol?
    var fbAuthorizer: AuthorizerProtocol?{
        didSet{
            if fbAuthorizer!.isLoggedIn(){
                fbAuthorizer!.logout()
            }
        }
    }
    var gpAuthorizer: AuthorizerProtocol?{
        didSet{
            if gpAuthorizer!.isLoggedIn(){
                gpAuthorizer!.logout()
            }
        }
    }
    func fbLoginRequested(){
        self.fbAuthorizer!.authorize()
    }
    func gpLoginRequested(){
        self.gpAuthorizer!.authorize()
    }
    
    func authorized(withAuthorizer authorizer: AuthorizerProtocol, withUserInfo info: UserInfoProtocol) {
        self.presenter?.loggedIn(withUserInfo: info)
    }
    
    func authorizationCanceled(withAuthorizer authorizer: AuthorizerProtocol) {
        self.presenter?.loginCanceled(with: authorizer)
    }
    
    func authorizationFailed(withAuthorizer authorizer: AuthorizerProtocol, withError error: String) {
        self.presenter?.failedToLoginWithError(error)
    }
    
    func loggedOut(withAuthorizer authorizer: AuthorizerProtocol) {

    }
}
