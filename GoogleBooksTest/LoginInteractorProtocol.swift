//
//  LoginInteractorProtocols.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol LoginInteractorProtocol{
    var presenter: LoginPresenterProtocol? { get set }
    var fbAuthorizer: AuthorizerProtocol? { get set }
    var gpAuthorizer: AuthorizerProtocol? { get set }
    func fbLoginRequested()
    func gpLoginRequested()
    func authorized(withAuthorizer authorizer: AuthorizerProtocol, withUserInfo info: UserInfoProtocol)
    func authorizationFailed(withAuthorizer authorizer: AuthorizerProtocol, withError error: String)
    func authorizationCanceled(withAuthorizer authorizer: AuthorizerProtocol)
    func loggedOut(withAuthorizer authorizer: AuthorizerProtocol)
}
