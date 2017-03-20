//
//  VolumeDetailsInteractorProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumeDetailsInteractorProtocol {
    var volumeItem: VolumeItemUIProtocol { get }
    var volumeDetails: VolumeDetailsUIProtocol? { set get }
    func addVolumeToCart()
    func removeVolumeFromCart()
    func updateVolumeDetails()
    func isVolumeInCart() -> Bool
}
