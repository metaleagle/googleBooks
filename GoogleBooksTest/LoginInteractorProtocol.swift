//
//  LoginInteractorProtocols.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol LoginInteractorProtocol{
    var presenter: LoginPresenterProtocol? { get set }
    func fbloginRequested()
    func gpRequested()
}
