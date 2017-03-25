//
//  VolumeDetailsLocalStorageProtocol.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumeDetailsLocalStorageProtocol{
    var volumeID: String { get }
    func isVolumeInCart() -> Bool
    func addVolumeToCart(volumeToBeAdded:VolumeDetailsUIProtocol)
    func removeVolumeFromCart()
    func getVolumeDetails() throws -> VolumeDetailsUIProtocol
    var volumeUpdatedAction: (() -> ())? { get set }
}
