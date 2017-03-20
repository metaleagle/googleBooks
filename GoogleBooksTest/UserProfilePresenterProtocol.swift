//
//  UserProfileInteractorProtocol.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol UserProfileInteractorProtocol{
    var view: UserInfoProtocol? { set get }
    func viewDidLoad()
    func userInfoUpdated()
}
