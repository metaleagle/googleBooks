//
//  UserProfileRouterProtocol.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit
protocol UserProfileRouterProtocol{
    static func userProfileModule(for userInfo: UserInfoProtocol) -> UIViewController
}
