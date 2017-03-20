//
//  UserProfilePresenterProtocol.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol UserProfilePresenterProtocol: class{
    var view: UserProfileViewProtocol? { set get }
    var interactor: UserProfileInteractorProtocol? {set get}
    var router: UserProfileRouterProtocol? {get set}
    func viewDidLoad()
    func userInfoUpdated()
}
