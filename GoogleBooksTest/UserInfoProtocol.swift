//
//  UserInfoProtocol.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol UserInfoProtocol {
    var firstName: String? { get }
    var lastName: String? { get }
    var email: String { get }
    var userpicURL: String? { get }
    var fullUserName: String {get}
}
