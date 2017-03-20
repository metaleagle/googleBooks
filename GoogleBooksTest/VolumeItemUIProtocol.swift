//
//  VolumeUIProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 15.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumeItemUIProtocol {
    var volumeID: String { get }
    var title: String { get }
    var authors: [String]? { get }
    var thumbURL: String? { get }
    var infoLink: String? { get }
}
