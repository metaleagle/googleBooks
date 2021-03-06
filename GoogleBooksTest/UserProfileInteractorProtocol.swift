//
//  UserProfileInteractorProtocol.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol UserProfileInteractorProtocol {
    var presenter: UserProfilePresenterProtocol? {set get}
    func getUserProfile() ->UserInfoProtocol
}
