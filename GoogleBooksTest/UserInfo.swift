//
//  UserInfo.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 13.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

struct UserInfo: UserInfoProtocol {
    var firstName: String?
    var lastName: String?
    var email: String
    var userpicURL: String?
    var fullUserName: String{
        get{
            return "" + ((nil != self.firstName) ? self.firstName! + " ":"") + (self.lastName ?? "")
        }
    }
}
