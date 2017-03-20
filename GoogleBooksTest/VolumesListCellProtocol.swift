//
//  VolumesListCellProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit
protocol VolumesListCellProtocol{
    var thumbnail: UIImageView! { get }
    func setVolumeTitle(_ title: String)
    func setVolumeAuthors(_ authors: [String]?)
}
