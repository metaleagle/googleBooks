//
//  UserProfileInteractor.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class UserProfileInteractor: UserProfileInteractorProtocol{
    weak var presenter: UserProfilePresenterProtocol?
    var userInfo: UserInfoProtocol{
        didSet{
            self.presenter?.userInfoUpdated()
        }
    }
    init(with userInfo: UserInfoProtocol){
        self.userInfo = userInfo
    }
    
    func getUserProfile() -> UserInfoProtocol {
        return self.userInfo
    }
    
}
