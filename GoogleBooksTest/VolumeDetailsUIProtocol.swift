//
//  VolumeDetailsUIProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumeDetailsUIProtocol{
    var volumeID: String { get }
    var title: String { get }
    var authors: [String]? { get }
    var description: String? { get }
    var coverImageURL: String? { get }
    var selfLink: String? { get }
}
