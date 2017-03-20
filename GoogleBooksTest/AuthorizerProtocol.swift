//
//  AuthorizerProtocol.swift
//  FBLoginTest
//
//  Created by Андрей Данишевский on 13.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol AuthorizerProtocol {
    var interactor: LoginInteractorProtocol { get }
    
    func authorize()
    func logout()
    func isLoggedIn () -> Bool
}
