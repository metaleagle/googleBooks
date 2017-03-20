//
//  UITableViewCell+ReuseID.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 15.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

extension UITableViewCell{
    class func reuseID() -> String{
        return String(describing: self)
    }
}
