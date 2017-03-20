//
//  LoginRouterProtocol.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    static func loginModule() -> UIViewController
    func didLogin(with userInfo: UserInfoProtocol, inView view: LoginViewProtocol)
}
