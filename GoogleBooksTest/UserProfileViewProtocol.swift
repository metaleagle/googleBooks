//
//  UserProfileViewProtocol.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
protocol UserProfileViewProtocol: class {
    var presenter: UserProfilePresenterProtocol? {set get}
    func setUserName(_ name: String)
    func setUserImage(with url:String)
}
