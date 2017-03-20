//
//  VolumeDetailsViewProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit

protocol VolumeDetailsViewProtocol: class {
    var coverImage: UIImageView! { get }
    func setVolumeTitile(_ title: String)
    func setVolumeAuthors(_ authors: [String]?)
    func setVolumeDescription(_ description: String?)
    func setPurchaseButtonVisible(_ isVisible: Bool)
    func setupAddToCartButton(_ isItemInCart: Bool)
}
