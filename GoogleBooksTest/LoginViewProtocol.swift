//
//  LoginViewProtocol.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol LoginViewProtocol: class{
    var presenter: LoginPresenterProtocol? { get set }
    
    func showLoading(_ isLoading: Bool)
    func displayErrorWithMessage(_ message: String)
}
