//
//  LoginPresenterProtocol.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol LoginPresenterProtocol: class{
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    //VIEW >> PRESENTER methods
    func fbLoginRequested()
    func gpLoginRequested()
    
    //PRESENTER<<INTERACTOR methods
    func loggedIn(withUserInfo info: UserInfoProtocol)
    func failedToLoginWithError(_ error: String)
    func loginCanceled(with authorizer:AuthorizerProtocol)
}
